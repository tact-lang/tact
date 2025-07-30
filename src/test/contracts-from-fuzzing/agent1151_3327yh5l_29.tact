struct Nesting {
    i: Int;
    b: Bool;
}

contract ComplexParams(
    n1: Nesting,
    s: String,
    opt: Int?
) {
    receive() {
        dump(self.n1.i);
    }
}