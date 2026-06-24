struct Inner { a: Int }
struct Outer { b: Inner }

contract Test {
    val: Outer;

    init() {
        self.val = Outer{ b: Inner{ a: 1 } };
    }
}