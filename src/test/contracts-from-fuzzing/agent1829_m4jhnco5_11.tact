struct Inner { a: Int; }
struct Mid { b: Inner?; }
struct Outer { c: Mid?; }

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ c: null };
    }
}