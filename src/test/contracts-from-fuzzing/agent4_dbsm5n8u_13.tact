struct HasBool {
    flag: Bool;
    val: Int;
}

contract TestContract {
    hb: HasBool;

    init() {
        self.hb = HasBool{ flag: true, val: 123 };
    }
}