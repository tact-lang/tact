struct S {
    f: Int;
}
contract DirectField {
    x: S;
    init() {
        self.x = S{ f: 99 };
    }
    get fun f(): Int {
        return self.x.f;
    }
}