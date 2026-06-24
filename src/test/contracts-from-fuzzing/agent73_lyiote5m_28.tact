struct Inner { a: Int }
struct Middle { m: Inner }
struct Outer { o: Middle }

contract Test {
    val: Outer;

    init() {
        self.val = Outer{ o: Middle{ m: Inner{ a: 5 } } };
    }
}