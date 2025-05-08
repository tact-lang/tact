struct Nest {
    v: Int?;
    b: Bool;
    s: String;
}

contract Test {
    n: Nest?;

    init() {
        self.n = null;
    }
}