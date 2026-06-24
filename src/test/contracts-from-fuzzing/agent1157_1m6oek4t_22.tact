struct DefVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "def";
}

contract DefaultsOverrideTest {
    val: DefVals;

    init() {
        self.val = DefVals{
            a: 42,
            b: false,
            c: "override"
        };
    }

    receive() {
        let tmp = self.val;
    }
}