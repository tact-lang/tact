struct SInner {
    val: Int?;
}

struct Container {
    a: Int;
    b: SInner?;
}

contract ComboTest {
    s: Container;

    init() {
        self.s = Container{
            a: 99,
            b: null
        };
    }
}
