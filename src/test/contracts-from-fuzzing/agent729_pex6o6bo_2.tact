struct Inner {
    x: Int;
    y: String;
    flag: Bool?;
}

contract NestedStructContract {
    data: Inner;

    init() {
        self.data = Inner{
            x: 42,
            y: "nested",
            flag: null,
        };
    }

    receive() {}
}