# xs2a-react-native

Integrate FinTecSystems' XS2A into your React Native App.

## Installation

```sh
npm install @fintecsystems/xs2a-react-native --save
```

### iOS
```sh
cd ios/
pod install
```

### Android
Make sure, that your app's `minSdkVersion` is 21 or higher and that your `compileSdkVersion` and `targetSdkVersion` is 31 or higher.

Because of that your `gradle-build-tools`-version has to be `4.2.0` or higher.

`android/build.gradle`
```groovy
// Top-level build file where you can add configuration options common to all sub-projects/modules.

buildscript {
    ext {
        minSdkVersion = 21 // Upgrade if needed
        compileSdkVersion = 31 // Upgrade if needed
        targetSdkVersion = 31 // Upgrade if needed
    }
    repositories {
        google()
        jcenter()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:4.2.2") // Upgrade if needed
...
```

## Usage

```jsx
import Xs2aReactNativeViewManager from "@fintecsystems/xs2a-react-native";

// ...

<Xs2aReactNativeViewManager
  style={{ width: '100%', height: '100%' }}
  wizardSessionKey="YOUR_WIZARD_SESSION_KEY"
  onSuccess={({ nativeEvent: { credentials } }) => {
    // e.g. redirect to success screen

    // 'credentials' is only provided for XS2A.API sessions
    // with sync_mode = shared
    console.log('Success');
  }}
  onAbort={() => {
    // e.g. redirect to abort screen
    console.log('Abort');
  }}
  onNetworkError={() => {
    // e.g. redirect to error screen
    console.log('Network error');
  }}
  onBackButtonTapped={({ nativeEvent: { currentStep } }) => {
    // Called when the back button was tapped. Optional to implement.
    // currentStep can be any of "login", "tan", "account", "bank" or empty string ("")
  }}
  onSessionError={({ nativeEvent: { errorCode, recoverable } }) => {
    /**
    Session errors occur during a session.
    Implementation of the different cases below is optional.
    No action needs to be taken for them, in fact we recommend
    to let the user handle the completion of the session until one of the above .success or .failure cases is called.
    You can however use below cases for measuring purposes.
    NOTE: Should you decide to do navigation to different screens based on below cases, you should only do so
    in case of the recoverable parameter being false, otherwise the user can still finish the session.
    */
    // Detailed error descriptions can be found here: https://github.com/FinTecSystems/xs2a-ios#configure-and-present-the-view
    console.log(errorCode, recoverable);
  }}
  // All styles are optional
  styleProvider={{
    tintColor: '#ff0000',
    logoVariation: 'STANDARD',
    backgroundColor: '#ffffff',
    textColor: '#000000',
    inputBackgroundColor: '#059392',
    inputBorderRadius: 15,
    inputTextColor: '#000000',
    placeholderColor: '#dddddd',
    buttonBorderRadius: 9,
    submitButtonStyle: {
      textColor: '#000000',
      backgroundColor: '#dddddd',
    },
    backButtonStyle: {
      textColor: '#000000',
      backgroundColor: '#dddddd',
    },
    abortButtonStyle: {
      textColor: '#000000',
      backgroundColor: '#dddddd',
    },
    restartButtonStyle: {
      textColor: '#000000',
      backgroundColor: '#dddddd',
    },
    alertBorderRadius: 12,
    errorStyle: {
      textColor: '#000000',
      backgroundColor: '#dddddd',
    },
    warningStyle: {
      textColor: '#000000',
      backgroundColor: '#dddddd',
    },
    infoStyle: {
      textColor: '#000000',
      backgroundColor: '#dddddd',
    },
  }}
/>
```

### License

Please note that this mobile SDK is subject to the MIT license. MIT license does not apply to the logo of FinTecSystems GmbH, the terms of use and the privacy policy of FinTecSystems GmbH. The license terms of the logo of FinTecSystems GmbH, the terms of use and the privacy policy of FinTecSystems GmbH are included in the LICENSE as FTS LICENSE.
