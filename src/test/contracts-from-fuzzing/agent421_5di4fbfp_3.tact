struct InnerMost { val: Int; }
struct Middle { mid: InnerMost; }
struct Outer { m: Middle; }

contract DeepTest {
    st: Outer;

    init() {
        self.st = Outer{ m: Middle{ mid: InnerMost{ val: 42 } } };
    }
}
