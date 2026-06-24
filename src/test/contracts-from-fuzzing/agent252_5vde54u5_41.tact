struct IntMin {
    a: Int as int1;
    b: Int as int257;
}

contract IntSizesTest {
    val: IntMin;

    init() {
        self.val = IntMin{
            a: 0,
            b: 0
        };
    }
}