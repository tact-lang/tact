struct OptNested {
    num: Int;
    flag: Bool;
}

contract OptionalStructTest {
    data: OptNested?;
    val: Int;

    init() {
        self.data = OptNested{ num: 77, flag: true };
        self.val = 5;
    }
}
