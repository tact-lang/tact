// optional String persistent field
contract TestContract {
  message: String?;

  init() {
    self.message = null;
  }
}