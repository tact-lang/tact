struct Thin {
    tiny: Int as int1;
}

contract ThinIntTest {
    val: Thin;

    init() {
        self.val = Thin{ tiny: 1 };
    }
}