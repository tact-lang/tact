struct OptCoins {
    maybeAmount: Int? as coins;
}

contract OptionalCoinsTest {
    value: OptCoins;

    init() {
        self.value = OptCoins{
            maybeAmount: null,
        };
    }
}
