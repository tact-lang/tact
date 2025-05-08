struct ContactInfo {
  email: String?;
  phone: String?;
}

struct Profile {
  username: String;
  contact: ContactInfo?;
  mainAddr: Address?;
}

contract TestContract {
  profile: Profile?;
  init() {
    self.profile = null;
  }
}