struct OptBoolInt {
    o: Int?;
    b: Bool?;
}

contract OptBoolIntContract {
    s: OptBoolInt;

    init() {
        self.s = OptBoolInt{ o: null, b: null };
    }
}