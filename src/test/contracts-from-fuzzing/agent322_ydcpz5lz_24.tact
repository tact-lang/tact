struct Wrapping {
    inner1: Int;
    inner2: Int?;
    inner3: String;
}

contract Test {
    wrap: Wrapping?;

    init() {
        self.wrap = Wrapping{inner1: 1, inner2: null, inner3: "ok"};
    }
}