struct Inner {
    x: Int;
    y: Int?;
    name: String;
}

contract Test2 {
    params: Inner;

    init() {
        self.params = Inner{
            x: 1,
            y: null,
            name: "abc",
        };
    }
}