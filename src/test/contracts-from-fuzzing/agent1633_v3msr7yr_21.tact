struct Wrapper {
    innerInt: Int;
    innerBool: Bool;
}

contract MultiAssign {
    a: Int;
    b: Bool;
    w: Wrapper;

    init() {
        self.a = 5;
        self.b = true;
        self.w = Wrapper{ innerInt: 7, innerBool: false };

        self.a = 10;
        self.w = Wrapper{ innerInt: 20, innerBool: true };
    }
}