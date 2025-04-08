struct OptionalEmbedded {
  inner: Int?;
}

contract OptionalEmbeddedInStorage {
  container: OptionalEmbedded;

  init() {
    self.container = OptionalEmbedded{inner: null};
  }
}