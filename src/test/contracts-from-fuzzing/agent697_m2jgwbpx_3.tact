struct Inner {
    x: Int;
    y: String;
    opt: Bool?;
}

contract Test {
    data: Inner = Inner{ x: 1, y: "abc", opt: null };

    init() {
        self.data = Inner{ x: 5, y: "def", opt: true };
    }

    receive() {}
}