# Deprecated. Moved to [https://pub.dartlang.org/packages/ng2_g_signin](https://pub.dartlang.org/packages/ng2_g_signin)

# angular2_google_signin

Angular2 Dart google sign-in component.

This package consists of

 * The dart interop code of Google Sign-In JavaScript client (using package:js).
 * Angular2 component to wrap the interop code.

For more information about Google Sign-In JavaScript client, See
https://developers.google.com/identity/sign-in/web/sign-in

## Usage

Add this script tag below in the head tag of web/index.html
```html
<script src="https://apis.google.com/js/platform.js" async defer></script>
```

Import this in a ng2 component and add `GoogleSignin` on the directives.

```dart
import 'package:angular2_google_signin/angular2_google_signin.dart';

@Component(
    selector: 'app-component',
    templateUrl: 'template/app_component.html',
    directives: const [GoogleSignin]
)
class AppComponent {

  onGoogleSigninSuccess(GoogleSignInSuccess event) async {
    GoogleUser googleUser = event.googleUser;
    String id = googleUser.getId();
    assert(googleUser.isSignedIn());
    BasicProfile profile = googleUser.getBasicProfile();
    print('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    assert(profile.getId() == id);
    print('Name: ' + profile.getName());
    print('Image URL: ' + profile.getImageUrl());
    print('Email: ' + profile.getEmail());
    AuthResponse response = googleUser.getAuthResponse();
    print('id_token: ' + response.id_token);
    print('access_token: ' + response.access_token.toString());
    print('login_hint: ' + response.login_hint);
    print('scope: ' + response.scope.toString());
    print('expires_in: ' + response.expires_in.toString());
    print('first_issued_at: ' + response.first_issued_at.toString());
    print('expires_at: ' + response.expires_at.toString());
    GoogleAuth auth =  getAuthInstance();
    GoogleUser user = auth.currentUser.get();
    assert(user.hashCode == googleUser.hashCode);
    await auth.signOut();
    print('User signed out.');
  }
}
```

In a ng2 component template, put `<google-signin>` with attributes of render options and init params.
`clientId` attribute is required. You don't need to write `google-signin-client_id` meta tag.
```html
<google-signin clientId="..." width="240" theme="dark" scope="email profile" longTitle="true"
                 (googleSigninSuccess)="onGgoogleSigninSuccess($event)"></google-signin>
```

Also see `example/`.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/ntaoo/angular2_google_signin/issues


