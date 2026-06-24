struct OptNum {
    a: Int?;
}

contract OptionalAssign {
    f: OptNum;

    init() {
        self.f = OptNum{ a: null };
    }
}