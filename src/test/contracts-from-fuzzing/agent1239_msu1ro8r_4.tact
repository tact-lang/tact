contract ContractWithStrings {
  name: String;
  message: String;
  empty: String;

  init() {
    self.name = "Alice";
    self.message = "Hello, TON!";
    self.empty = "";
  }
}