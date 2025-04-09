struct S {
    x: Int;
    y: Bool;
    z: String;
}

contract MultiFields {
    f1: S?;
    f2: S?;
    f3: S?;
    f4: S?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
    }
}