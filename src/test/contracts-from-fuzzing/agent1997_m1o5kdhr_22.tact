struct Profile {
  name: String;
  active: Bool;
}

contract OptionalNestedParam(
  profile: Profile?,
) {
  receive() {
    if (self.profile != null) {
      let _ = self.profile!!;
    }
  }
}
