struct SDefault {
    a: Int = 42;
    b: Bool;
}

contract StructWithDefaultField {
    s: SDefault;

    init() {
        self.s = SDefault{ b: true };
    }
}