struct InnerBool {
    flag: Bool;
}

contract ArrayOfStructs {
    f1: InnerBool;
    f2: InnerBool;
    f3: InnerBool;
    f4: InnerBool;

    init() {
        self.f1 = InnerBool{ flag: true };
        self.f2 = InnerBool{ flag: false };
        self.f3 = InnerBool{ flag: true };
        self.f4 = InnerBool{ flag: false };
    }
}