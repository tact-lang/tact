struct S {
    a: Int?;
    b: Bool?;
    c: String?;
}
contract TestContract {
    f1: S?;
    init() {
        self.f1 = null;
    }
}