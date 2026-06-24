contract OptionalAddressInit {
    a: Address?;
    init() {
      self.a = null;
    }
}