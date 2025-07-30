struct Inner { a: Int; }
struct Outer { b: Inner; }

contract Test {
    v1: Int;
    v2: Bool;
    v3: String;
    s: Outer;

    init() {
        self.v1 = 1;
        self.v2 = true;
        self.v3 = "text";
        self.s = Outer{ b: Inner{ a: 5 } };
    }
}