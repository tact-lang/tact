struct NestedDuo {
    alpha: Bool;
    beta: Int?;
}

contract DeepOptionalTest {
    duo: NestedDuo?;

    init() {
        self.duo = null;
    }
}