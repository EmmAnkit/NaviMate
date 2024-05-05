import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? deText = '',
  }) =>
      [enText, deText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'ae9zef8d': {
      'en': 'Welcome,',
      'de': '',
    },
    'mw6i2pmy': {
      'en': 'Our Services:',
      'de': '',
    },
    'kui3mkul': {
      'en': 'Health',
      'de': '',
    },
    'maqfmh50': {
      'en': 'Insurance',
      'de': '',
    },
    'uzx58jgt': {
      'en': 'Bank',
      'de': '',
    },
    'h66mlyjj': {
      'en': 'Housing',
      'de': '',
    },
    'gvwqqjba': {
      'en': 'Education',
      'de': '',
    },
    '1oytn7vs': {
      'en': 'Store',
      'de': '',
    },
    'rhyag5of': {
      'en': 'Home',
      'de': '',
    },
  },
  // profile
  {
    'txrvrdrx': {
      'en': 'Email',
      'de': '',
    },
    'vvindmqc': {
      'en': 'University',
      'de': '',
    },
    'a3vofz8h': {
      'en': 'Country',
      'de': '',
    },
    'nn2750ny': {
      'en': 'Birth date',
      'de': '',
    },
    'u24kub8a': {
      'en': 'Your Account',
      'de': '',
    },
    'tqbmco41': {
      'en': 'Edit Profile',
      'de': '',
    },
    '9jyzej0u': {
      'en': 'App Settings',
      'de': '',
    },
    '05hxyji9': {
      'en': 'About Us',
      'de': '',
    },
    '26u6w9ea': {
      'en': 'Terms of Service',
      'de': '',
    },
    'lrakp3od': {
      'en': 'Log Out',
      'de': '',
    },
    'jul9fgbk': {
      'en': 'Profile',
      'de': '',
    },
  },
  // Notification
  {
    'fr6uqjzf': {
      'en': 'map',
      'de': '',
    },
    'm6bazpz2': {
      'en': 'No more reminders!',
      'de': '',
    },
    '60rsphme': {
      'en': 'Reminders',
      'de': '',
    },
    '32ztdycv': {
      'en': 'Notification',
      'de': '',
    },
  },
  // Health
  {
    '6f3u330s': {
      'en': 'Health Services',
      'de': '',
    },
  },
  // Emergency
  {
    '23mpnfxc': {
      'en': 'Emergency Hotline',
      'de': '',
    },
    '05e61u9j': {
      'en': 'Fire:',
      'de': '',
    },
    'h70lq5mu': {
      'en': '112',
      'de': '',
    },
    'wcbzthuw': {
      'en': 'Police:',
      'de': '',
    },
    'jq2t4uvp': {
      'en': '110',
      'de': '',
    },
    'su3rnus9': {
      'en': 'Medical:',
      'de': '',
    },
    'slzm3r2u': {
      'en': '112',
      'de': '',
    },
    's3tujxw9': {
      'en': 'Campus security:',
      'de': '',
    },
    'oehpg1dn': {
      'en': '0421 200-4815',
      'de': '',
    },
    'bgzr8zb2': {
      'en': 'In case of an emergency, follow these steps:',
      'de': '',
    },
    'i8x0joab': {
      'en': '1. Stay calm and assess the situation.',
      'de': '',
    },
    'uu7t3oqe': {
      'en': '2. Call the local emergency number immediately.',
      'de': '',
    },
    '4mz3n3tq': {
      'en': '3. Provide clear and accurate information.',
      'de': '',
    },
    '0doilq9i': {
      'en': '4. Follow the instructions given by the emergency operator.',
      'de': '',
    },
    'otj6rdv5': {
      'en': 'Emergency Info',
      'de': '',
    },
  },
  // Genpracti
  {
    'tcsn6t51': {
      'en': 'Near Campus',
      'de': '',
    },
    'vr8yatln': {
      'en': 'Dr. Hagen Schmidtmann',
      'de': '',
    },
    'o24bvriz': {
      'en': 'Pumpenstrasse 10',
      'de': '',
    },
    'ia4ec67b': {
      'en': '28759 Bremen',
      'de': '',
    },
    'aa4fu3vo': {
      'en': 'map',
      'de': '',
    },
    'ychdxw5f': {
      'en': '+49421627171',
      'de': '',
    },
    'i17281gg': {
      'en': 'Dr. Oliver Kahlen',
      'de': '',
    },
    '40f3gnhn': {
      'en': 'Reeder-Bischoff-Str. 28',
      'de': '',
    },
    '2yf73m1u': {
      'en': '28757 Bremen',
      'de': '',
    },
    'x5fm8arq': {
      'en': 'map',
      'de': '',
    },
    '5mvxpsbk': {
      'en': '+49421663036',
      'de': '',
    },
    'nkwl4jso': {
      'en': 'Dr. Hans Martin Noltenius',
      'de': '',
    },
    '0vabqgfz': {
      'en': 'Gerhard-Rohlfs-Strasse 16 a',
      'de': '',
    },
    'p5zv3hv7': {
      'en': '28757 Bremen',
      'de': '',
    },
    '0cbfnacb': {
      'en': 'map',
      'de': '',
    },
    'f6dnojs5': {
      'en': '+49421669039',
      'de': '',
    },
    'xighyo1w': {
      'en': 'General Practitioners',
      'de': '',
    },
  },
  // Login
  {
    'z7p8u4cu': {
      'en': 'NaviMate',
      'de': '',
    },
    'dg5uacfn': {
      'en': 'Email',
      'de': '',
    },
    'b03ugqxu': {
      'en': 'Password',
      'de': '',
    },
    'qd3ccuqc': {
      'en': 'Sign In',
      'de': '',
    },
    'kdoubwt2': {
      'en': 'Forgot Password',
      'de': '',
    },
    'h5ojpnjk': {
      'en': 'Sign up',
      'de': '',
    },
    'zxvv5qoc': {
      'en': 'Emergency',
      'de': '',
    },
    '1iskulnl': {
      'en': 'Home',
      'de': '',
    },
  },
  // createacc
  {
    '525teg6l': {
      'en': 'NaviMate',
      'de': '',
    },
    'pklqzsn3': {
      'en': 'Create an account',
      'de': '',
    },
    's41wgs6r': {
      'en': 'Let\'s get started by filling out the form below.',
      'de': '',
    },
    '0xy926ks': {
      'en': 'Name Surname',
      'de': '',
    },
    'bjfg629m': {
      'en': 'Constructor University',
      'de': '',
    },
    '370mupqm': {
      'en': 'Select University',
      'de': '',
    },
    '8r12i6ks': {
      'en': 'Search for an item...',
      'de': '',
    },
    'e1n7x10z': {
      'en': 'Email',
      'de': '',
    },
    '37cazn3o': {
      'en': 'Password',
      'de': '',
    },
    '3mclwm6f': {
      'en': 'Confirm Password',
      'de': '',
    },
    'c5uiaen4': {
      'en': 'Create Account',
      'de': '',
    },
    'gw58c7b5': {
      'en': 'Already have an account? ',
      'de': '',
    },
    'eq1fd6i3': {
      'en': ' Sign In here',
      'de': '',
    },
    'tyv6g3ra': {
      'en': 'UserName',
      'de': '',
    },
    'e5q4zsiw': {
      'en': 'Overall',
      'de': '',
    },
    'dli6n8at': {
      'en': '5',
      'de': '',
    },
    'g9k6virj': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'de': '',
    },
    's3sblrcy': {
      'en': 'Home',
      'de': '',
    },
  },
  // Insurance
  {
    '3ty7wfwu': {
      'en': 'Public Insurances',
      'de': '',
    },
    'hd0cmrh1': {
      'en': 'TK',
      'de': '',
    },
    'xl02gzl5': {
      'en': 'AOK\n',
      'de': '',
    },
    'vd672f23': {
      'en': 'Insurance',
      'de': '',
    },
  },
  // TKinsur
  {
    '5lzmqjaz': {
      'en': 'Techniker Krankenkasse',
      'de': '',
    },
    '3zdc9o4i': {
      'en':
          'Techniker Krankenkasse insurees benefit from medical treatment based on state-of-the-art science. Techniker Krankenkasse focuses on a comprehensive care concept for a range of therapies and treatments - from outpatient surgery up to the treatment of chronic diseases. The individual treatment steps are better coordinated, making your treatment more efficient.',
      'de': '',
    },
    '5q7sf955': {
      'en':
          'Techniker Krankenkasse has special contracts with hospitals in many European countries. Just show your TK eHealth card and you will get the medical care you need.',
      'de': '',
    },
    '9xscskts': {
      'en': 'Learn More',
      'de': '',
    },
    'eliqur8j': {
      'en': 'TK',
      'de': '',
    },
  },
  // AOKInsur
  {
    's5pcre25': {
      'en': 'Allgemeine Ortskrankenkasse',
      'de': '',
    },
    '2slyubf0': {
      'en':
          'AOK is one of the biggest health insurance companies in Germany with over 27 million policyholders and takes extra special care of students.',
      'de': '',
    },
    'k2d77ff0': {
      'en':
          'AOK is a provider of statutory health insurance. They pay out for treatment by doctors and dentists, drugs, therapy (e.g. massages, physiotherapy, etc.) and assistive equipment (e.g. walking aids), and hospital treatment. Some of these services incur an additional charge. This applies to everyone, no matter what health insurance provider they are with. AOK also strives to prevent illnesses from happening in the first place and, if they do happen, to detect them as early as possible and to treat them appropriately. They therefore pay for all legally required preventive examinations and offer their policyholders advice and courses on becoming healthy and staying healthy.',
      'de': '',
    },
    'd14v6vb1': {
      'en': 'Learn More',
      'de': '',
    },
    'omyzidhu': {
      'en': 'AOK',
      'de': '',
    },
  },
  // Specialist
  {
    'dlas4smu': {
      'en': 'Near Campus',
      'de': '',
    },
    'zlyxb33p': {
      'en': 'Dr.  Dietmar Schulte am Hülse',
      'de': '',
    },
    'ubw885dc': {
      'en': 'Dentist',
      'de': '',
    },
    '5t9ebvhm': {
      'en': 'Vegesacker Bahnhofsplatz 2',
      'de': '',
    },
    'ksdhhr6v': {
      'en': '28757 Bremen',
      'de': '',
    },
    'b4wtmw7d': {
      'en': 'map',
      'de': '',
    },
    'd2ekn373': {
      'en': '0421–669 66 10',
      'de': '',
    },
    'ov9wxmxp': {
      'en': 'Mostafa Shirazi',
      'de': '',
    },
    '8cmh39od': {
      'en': 'Dentist',
      'de': '',
    },
    '845de6di': {
      'en': 'Hindenburg Str.56',
      'de': '',
    },
    's1rdhfii': {
      'en': '28717 Bremen',
      'de': '',
    },
    '9avx2acm': {
      'en': '0421-639 72 33',
      'de': '',
    },
    'ho8mzhcy': {
      'en': 'Dr. Christa Goecke',
      'de': '',
    },
    'w3zfrl38': {
      'en': 'Gynecologist',
      'de': '',
    },
    'xpzfjvtj': {
      'en': 'Gerhard-Rohlfs Strasse 16 a',
      'de': '',
    },
    'giphori0': {
      'en': '28757 Bremen',
      'de': '',
    },
    '8ja0n7qk': {
      'en': 'map',
      'de': '',
    },
    'cbwqd3mc': {
      'en': '0421-665 98 55',
      'de': '',
    },
    'm3xlepgk': {
      'en': 'Dr.  Ingrid Böhnke',
      'de': '',
    },
    'jr1crgr0': {
      'en': 'Dermatologist',
      'de': '',
    },
    't0c43but': {
      'en': 'Gerhard-Rohlfs Strasse 16 a',
      'de': '',
    },
    '3zc5qecs': {
      'en': '28757 Bremen',
      'de': '',
    },
    'yltsmcre': {
      'en': 'map',
      'de': '',
    },
    'aiihy3ks': {
      'en': '0421-66 32 82',
      'de': '',
    },
    'kyei5i8n': {
      'en': 'Dr. Hans Udo Homoth',
      'de': '',
    },
    '4zwvkfuz': {
      'en': 'ENT',
      'de': '',
    },
    'e9wr03o5': {
      'en': 'Gerhard-Rohlfs-Straße 19',
      'de': '',
    },
    'wd0lh08u': {
      'en': '28757 Bremen',
      'de': '',
    },
    'wdvddlmn': {
      'en': 'map',
      'de': '',
    },
    'dmj95rwp': {
      'en': '0421-65 00 94',
      'de': '',
    },
    'o3ondjlu': {
      'en': 'Beate Zschausch',
      'de': '',
    },
    '8qna0s76': {
      'en': 'Eye',
      'de': '',
    },
    'ksbn0mqg': {
      'en': 'Reeder-Bischoff-Str. 28',
      'de': '',
    },
    'ohi7m6nh': {
      'en': '28757 Bremen',
      'de': '',
    },
    'h5xz5gyl': {
      'en': 'map',
      'de': '',
    },
    '13egjtxv': {
      'en': '0421-66 44 71',
      'de': '',
    },
    '5d9brnpl': {
      'en': 'Specialists',
      'de': '',
    },
  },
  // ForgotPassword
  {
    'hjv74hix': {
      'en': 'Back',
      'de': '',
    },
    'ep7q6wu1': {
      'en': 'Forgot Password',
      'de': '',
    },
    'vnlw0mrw': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'de': '',
    },
    'ng0pktpw': {
      'en': 'Your email address...',
      'de': '',
    },
    '623c0mck': {
      'en': 'Enter your email...',
      'de': '',
    },
    'e7o9bgxk': {
      'en': 'Send Link',
      'de': '',
    },
    '9tvi1vc7': {
      'en': 'Back',
      'de': '',
    },
    '5fodcdtx': {
      'en': 'Home',
      'de': '',
    },
  },
  // EditProfile
  {
    'p7vq1mu6': {
      'en': 'Name Surname',
      'de': '',
    },
    '4ushal3e': {
      'en': 'Country from',
      'de': '',
    },
    'fym9m1tz': {
      'en': 'Save Changes',
      'de': '',
    },
    'psp7goqo': {
      'en': 'Edit Profile',
      'de': '',
    },
  },
  // VerifyEmail
  {
    '5goyckpx': {
      'en': 'Verification link was sent! \nPlease check your email.',
      'de': '',
    },
    'e7fs4es4': {
      'en': 'Done!',
      'de': '',
    },
    'uejzo576': {
      'en': 'Verify E-mail!',
      'de': '',
    },
  },
  // AboutUs
  {
    'b9b4qacb': {
      'en': 'Members',
      'de': '',
    },
    'xchy0x3w': {
      'en': 'Below are a list of members of your team.',
      'de': '',
    },
    'g4kh8ug3': {
      'en': 'Ankit Lamsal',
      'de': '',
    },
    't98v40be': {
      'en': 'alamsal@constructor.university',
      'de': '',
    },
    'tg03gkry': {
      'en': 'Anushka Sharma',
      'de': '',
    },
    'p8x338qe': {
      'en': 'ansharma@constructor.university',
      'de': '',
    },
    'mof2vpcr': {
      'en': 'Mariam Machaidze',
      'de': '',
    },
    'huubi837': {
      'en': 'mmachaidze@constructor.university',
      'de': '',
    },
    '7lu7bndn': {
      'en': 'About us',
      'de': '',
    },
    'uo57xgsv': {
      'en': 'Home',
      'de': '',
    },
  },
  // GenPracDescription
  {
    '91x8t8rm': {
      'en': 'Insurance:',
      'de': '',
    },
    'j1wb7p0d': {
      'en': 'Language:',
      'de': '',
    },
    '6bej16nb': {
      'en': 'Appointments by:',
      'de': '',
    },
    'j9rk4yit': {
      'en': 'Billing type:',
      'de': '',
    },
    'hty7feaz': {
      'en': 'Opening hours:',
      'de': '',
    },
    'k2fd0owt': {
      'en': 'Email:',
      'de': '',
    },
    'a0s7tel7': {
      'en': 'More information',
      'de': '',
    },
    'ucv2mbcd': {
      'en': 'Reviews',
      'de': '',
    },
    '7mhxu8i0': {
      'en': 'Reviews',
      'de': '',
    },
    '3gvyhz0x': {
      'en': 'Write a Review',
      'de': '',
    },
    'bosq8hmp': {
      'en': 'Home',
      'de': '',
    },
  },
  // GenpractiMainPage
  {
    'o0b2q1ud': {
      'en': 'Search all articles...',
      'de': '',
    },
    'vtdslxv5': {
      'en': 'Filters and Sorting',
      'de': '',
    },
    '29xm1ilp': {
      'en': 'Open Now',
      'de': '',
    },
    'l3ukgxnx': {
      'en': 'English',
      'de': '',
    },
    '7g15fuh7': {
      'en': 'TK',
      'de': '',
    },
    'ez5qcjck': {
      'en': 'AOK',
      'de': '',
    },
    '2wevyjqo': {
      'en': 'Location - Near',
      'de': '',
    },
    'ynzvb01q': {
      'en': 'Reviews - Most like',
      'de': '',
    },
    'wb57pvh3': {
      'en': 'Work experience - Most',
      'de': '',
    },
    '3he7g4k4': {
      'en': 'Sort by',
      'de': '',
    },
    'ejnm1kk3': {
      'en': 'Search for an item...',
      'de': '',
    },
    'de2xaz5h': {
      'en': 'map',
      'de': '',
    },
    '87r37ckj': {
      'en': 'map',
      'de': '',
    },
    'r9dz60ok': {
      'en': 'map',
      'de': '',
    },
    'tg8bkxvw': {
      'en': 'General Practitioners',
      'de': '',
    },
  },
  // TermsConditions
  {
    'ex7e427r': {
      'en':
          '1. Introduction\n\nWelcome to Navimate! These Terms & Conditions govern your access and use of the Navimate mobile application. By downloading, installing, or using the App, you agree to be bound by these T&Cs.\n\n2. User Accounts\n\n2.1 To fully enjoy the benefits of Navimate, you can create a user account. \n2.2 Account creation requires you to be of legal age in Germany.\n2.3 Your Navimate account will not be linked to any social media accounts.\n\n3. User Data & Privacy\n\n3.1 We collect the following personal information from you during account creation: name, surname and email address. We also collect your university affiliation. \n3.2 We do not use your personal information for marketing purposes (e.g., sending emails or newsletters). \n3.3 We do not use any third-party digital analytics software to track your activity within the App. \n3.4 We do not display advertisements within the App. \n3.5 We take the privacy of your information seriously and will use it only for the purpose of providing and improving the Navimate service. \n3.6 We comply with all applicable German data protection regulations, including the General Data Protection Regulation (GDPR).\n\n4. User Content & Intellectual Property\n\n4.1 You retain all ownership rights to the content you upload or post on the App (comments, photos, reviews). \n4.2 By uploading content, you grant Navimate a non-exclusive, royalty-free license to use, reproduce, modify, publish, and distribute your content within the App, solely for the purpose of providing and improving the service. \n4.3 Navimate owns all intellectual property rights associated with the App itself.\n\n5. Acceptable Use\n\n5.1 You agree to use the App in a lawful, respectful, and non-intrusive manner. \n5.2 Prohibited activities include, but are not limited to: * Uploading illegal content or content that violates the rights of others (e.g., copyright infringement). Hate speech, harassment, bullying, or threats.  Spam or commercially oriented content not approved by Navimate. Distributing viruses or malware. Interfering with the functionality of the App.\n\n6. Disclaimers & Limitation of Liability\n\n6.1 Navimate strives to provide a reliable and functional App. However, we cannot guarantee uninterrupted or error-free service. \n6.2 The App is provided \"as is\" and to the extent permitted by law, Navimate disclaims all warranties, express or implied, including warranties of merchantability, fitness for a particular purpose, and non-infringement. \n6.3 Navimate shall not be liable for any damages arising from your use of the App, including but not limited to, direct, indirect, incidental, consequential, or punitive damages.\n\n7. Termination\n\nNavimate reserves the right to suspend or terminate your account at any time without notice for violating the T&Cs.\n\n8. Governing Law & Dispute Resolution\n\nThese T&Cs are governed by and construed in accordance with the laws of Germany. Any dispute arising out of or relating to the T&Cs will be resolved by the competent courts of Germany.\n\n9. Modifications to T&Cs\n\nNavimate reserves the right to modify these T&Cs at any time. We will notify you of any changes by posting the revised T&Cs within the App. Your continued use of the App after the revised T&Cs are posted constitutes your agreement to the changes.\n\n10. Additional Permissions\n\n10.1 The App utilizes: Geolocation: To provide location-based features and functionalities within the App. Photo Gallery Access: To allow you to upload photos from your device when adding content to the App. 10.2 We will only access your geolocation and photo gallery with your permission.\n\n11. Contact Us\n\nIf you have any questions about these T&Cs, your privacy, or data usage, please contact us at navimate.cub@gmail.com.\n',
      'de': '',
    },
    '28z3tkgy': {
      'en': 'Navimate Terms & Conditions',
      'de': '',
    },
    'wbw9k9zk': {
      'en': 'Home',
      'de': '',
    },
  },
  // MapsGenPrac
  {
    '63giy7h3': {
      'en': 'Map',
      'de': '',
    },
    '6xdymcmr': {
      'en': 'Home',
      'de': '',
    },
  },
  // writeReview
  {
    'fyfqq9c6': {
      'en': 'Anonymous',
      'de': '',
    },
    'anlhr3mu': {
      'en': 'Your Review',
      'de': '',
    },
    'sxx0upv7': {
      'en': 'Write your review here...',
      'de': '',
    },
    '8tsxv4u8': {
      'en': 'Publish Review',
      'de': '',
    },
    'i9x79ns8': {
      'en': 'Write a Review',
      'de': '',
    },
    'iu41naj2': {
      'en': 'Home',
      'de': '',
    },
  },
  // SpecialistsPage
  {
    'wfm802k6': {
      'en': 'Specialists',
      'de': '',
    },
  },
  // makeReminder
  {
    '6qe0zl3w': {
      'en': 'Warning! Making a reminder does not mean booking an appointment!',
      'de': '',
    },
    '0o5gkuts': {
      'en': 'Appointment with',
      'de': '',
    },
    'avcci6ja': {
      'en': 'Search for an item...',
      'de': '',
    },
    'j73nugnk': {
      'en': 'Make Reminder',
      'de': '',
    },
    'uoyo52rg': {
      'en': 'Reminder',
      'de': '',
    },
    'krmdrng9': {
      'en': 'Home',
      'de': '',
    },
  },
  // specialistSearchFinal
  {
    '8dsc64zd': {
      'en': 'Search all articles...',
      'de': '',
    },
    'i3k3roam': {
      'en': 'Filters and Sorting',
      'de': '',
    },
    'wlat4ifi': {
      'en': 'Open Now',
      'de': '',
    },
    'v8v9fc91': {
      'en': 'English',
      'de': '',
    },
    'qywey64n': {
      'en': 'TK',
      'de': '',
    },
    '27bnl6d0': {
      'en': 'AOK',
      'de': '',
    },
    'n0hi16ll': {
      'en': 'Location - Near',
      'de': '',
    },
    'hrwwhwvm': {
      'en': 'Reviews - Most like',
      'de': '',
    },
    'zgkxciao': {
      'en': 'Work experience - Most',
      'de': '',
    },
    '4597w832': {
      'en': 'Sort by',
      'de': '',
    },
    'zirex9vk': {
      'en': 'Search for an item...',
      'de': '',
    },
    'ogmknxx2': {
      'en': 'map',
      'de': '',
    },
    'g0xriy15': {
      'en': 'map',
      'de': '',
    },
  },
  // specialistsDescription
  {
    '2kms1vtg': {
      'en': 'Insurance:',
      'de': '',
    },
    'm4k5tyfc': {
      'en': 'Language:',
      'de': '',
    },
    'ai7671yd': {
      'en': 'Appointments by:',
      'de': '',
    },
    'n5wp69ja': {
      'en': 'Opening hours:',
      'de': '',
    },
    'qq01s8qk': {
      'en': 'Email:',
      'de': '',
    },
    'twg2y1lr': {
      'en': 'More information',
      'de': '',
    },
    '0l6bulfc': {
      'en': 'Home',
      'de': '',
    },
  },
  // HospitalsMainPage
  {
    'zcoz8cf4': {
      'en': 'Search all articles...',
      'de': '',
    },
    '4qx9dxng': {
      'en': 'Filters and Sorting',
      'de': '',
    },
    'jjlbpxxz': {
      'en': 'Open Now',
      'de': '',
    },
    'gzoir7r3': {
      'en': 'English',
      'de': '',
    },
    'lecmqjv4': {
      'en': 'TK',
      'de': '',
    },
    'afbpusjh': {
      'en': 'AOK',
      'de': '',
    },
    'itu5lgw3': {
      'en': 'Location - Near',
      'de': '',
    },
    '3o2f4nks': {
      'en': 'Reviews - Most like',
      'de': '',
    },
    'nfhcwaz0': {
      'en': 'Work experience - Most',
      'de': '',
    },
    '2ryf1t8h': {
      'en': 'Sort by',
      'de': '',
    },
    'llxwtlgm': {
      'en': 'Search for an item...',
      'de': '',
    },
    'yri2854o': {
      'en': 'map',
      'de': '',
    },
    '1ibe4a59': {
      'en': 'map',
      'de': '',
    },
    'g34h3tgj': {
      'en': 'Hospitals',
      'de': '',
    },
  },
  // HospitalsDescription
  {
    'p7n8r2ec': {
      'en': 'Insurance:',
      'de': '',
    },
    'z1kjjydk': {
      'en': 'Language:',
      'de': '',
    },
    'mrye86hy': {
      'en': 'Appointments by:',
      'de': '',
    },
    '8x92jdhw': {
      'en': 'Opening hours:',
      'de': '',
    },
    '5dfxd9w7': {
      'en': 'Email:',
      'de': '',
    },
    '8kg2ica5': {
      'en': 'More information',
      'de': '',
    },
    '2ss7217x': {
      'en': 'Home',
      'de': '',
    },
  },
  // MapsSpecialists
  {
    's6linz6f': {
      'en': 'Map',
      'de': '',
    },
    'vahta63i': {
      'en': 'Home',
      'de': '',
    },
  },
  // MapsHospitals
  {
    'j2gv34dl': {
      'en': 'Map',
      'de': '',
    },
    'vhxgcnmv': {
      'en': 'Home',
      'de': '',
    },
  },
  // Miscellaneous
  {
    'xwphu1it': {
      'en': '',
      'de': '',
    },
    'fb4px5ss': {
      'en': '',
      'de': '',
    },
    'ktb1bviy': {
      'en':
          'In order to find location, this app requires permission to access the location.',
      'de': '',
    },
    'ok2at06t': {
      'en': '',
      'de': '',
    },
    'ri2vreg1': {
      'en': '',
      'de': '',
    },
    'mbv2tt2m': {
      'en': '',
      'de': '',
    },
    '3npi8dgz': {
      'en': '',
      'de': '',
    },
    'qza0kf0e': {
      'en': '',
      'de': '',
    },
    'hvbvv1nt': {
      'en': '',
      'de': '',
    },
    'qwbt7h6o': {
      'en': '',
      'de': '',
    },
    'bwvuj64j': {
      'en': '',
      'de': '',
    },
    '0b2ixxp8': {
      'en': '',
      'de': '',
    },
    'a55l4nuq': {
      'en': '',
      'de': '',
    },
    'j0mlt6v1': {
      'en': '',
      'de': '',
    },
    's98lm091': {
      'en': '',
      'de': '',
    },
    '6pzd2qwb': {
      'en': '',
      'de': '',
    },
    'lv1e6gjn': {
      'en': '',
      'de': '',
    },
    'pke45mei': {
      'en': '',
      'de': '',
    },
    'kkuaai9m': {
      'en': '',
      'de': '',
    },
    'veypeplo': {
      'en': '',
      'de': '',
    },
    'iqwjc842': {
      'en': '',
      'de': '',
    },
    '0doycr0i': {
      'en': '',
      'de': '',
    },
    'wcid2qh6': {
      'en': '',
      'de': '',
    },
    '3dlc1dsy': {
      'en': '',
      'de': '',
    },
    '863c06zj': {
      'en': '',
      'de': '',
    },
    'lc7f1j2l': {
      'en': '',
      'de': '',
    },
    'keg0pi68': {
      'en': '',
      'de': '',
    },
    'oecxzunu': {
      'en': '',
      'de': '',
    },
  },
].reduce((a, b) => a..addAll(b));
