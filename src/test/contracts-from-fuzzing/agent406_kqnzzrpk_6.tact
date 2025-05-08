struct StructWithDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract TestContract {
    s: StructWithDefault;
    init() {
        self.s = StructWithDefault{};
    }
}