struct Defaults {
    foo: Int = 7;
    bar: Bool = false;
    question: Int?;
}

contract TestContract {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}
