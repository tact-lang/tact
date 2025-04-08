struct NestedOpt {
    foo: Int?;
    bar: String?;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{foo: 42, bar: "hello"};
    }
}