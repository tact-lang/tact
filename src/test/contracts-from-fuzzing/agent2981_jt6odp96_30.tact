struct NestedWithOption {
    inner: Int?;
    text: String;
}

contract Combination {
    nx: NestedWithOption;

    init() {
        self.nx = NestedWithOption{
            inner: null,
            text: "hello",
        };
    }
}