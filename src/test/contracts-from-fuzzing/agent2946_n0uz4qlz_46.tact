struct SDefault {
    a: Int = 1;
    b: Bool = false;
}
contract StructDefaultTest {
    s: SDefault;
    init() {
        self.s = SDefault{};
    }
}