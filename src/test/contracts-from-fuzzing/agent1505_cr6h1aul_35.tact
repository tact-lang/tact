struct OptDefault {
    x: Int?;
}
contract OptDftTest {
    s: OptDefault;
    init() {
        self.s = OptDefault{};
    }
}