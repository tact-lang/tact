// contract with persistent state variable explicitly typed as optional primitive Int
contract OptIntTest {
    x: Int?;

    init() {
        self.x = null;
    }
}
