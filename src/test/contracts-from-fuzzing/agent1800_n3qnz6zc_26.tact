struct OptTwice {
    first: Int?;
    second: Int?;
}

contract OptionalDuo {
    val: OptTwice;

    init() {
        self.val = OptTwice{
            first: null,
            second: 21
        };
    }
}