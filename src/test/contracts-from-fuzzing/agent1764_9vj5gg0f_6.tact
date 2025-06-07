struct Data {
    foo: Int;
    bar: String;
}

contract TestContract {
    maybe_data: Data?;

    init() {
        self.maybe_data = Data{ foo: 42, bar: "hi" };
    }
}
