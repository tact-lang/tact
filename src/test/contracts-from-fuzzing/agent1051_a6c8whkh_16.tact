struct OptionalStringHolder {
  data: String?;
}

contract TestContract {
    holder: OptionalStringHolder;
    init() {
        self.holder = OptionalStringHolder{ data: "hi" };
    }
}