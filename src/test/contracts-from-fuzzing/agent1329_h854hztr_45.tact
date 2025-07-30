struct OptBool {
    flag: Bool?;
}

contract TestOptBool {
    v: OptBool;

    init() {
        self.v = OptBool{ flag: null };
    }
}
