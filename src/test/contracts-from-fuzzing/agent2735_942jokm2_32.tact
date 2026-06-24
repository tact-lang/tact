message(1) M1 {
    val: Int;
}

contract MsgFieldTest {
    data: M1;

    init() {
        self.data = M1{ val: 42 };
    }
}
