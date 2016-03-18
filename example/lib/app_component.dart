import 'package:angular2/angular2.dart';
import 'package:angular2_google_signin/angular2_google_signin.dart';

@Component(selector: 'my-app', templateUrl: 'app_component.html', directives: const [GoogleSignin])
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