struct Resettable {
    val: Int;
}

contract ResetTest {
    s: Resettable;

    init() {
        self.s = Resettable{ val: 42 };
        self.s = Resettable{ val: -42 };
    }
}