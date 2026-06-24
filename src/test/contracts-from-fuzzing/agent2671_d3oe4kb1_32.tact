struct DoubleOption {
    a: Int?;
    b: Bool?;
}

contract DoubleOptionalUsage {
    val: DoubleOption?;

    init() {
        self.val = DoubleOption{
            a: 5,
            b: null
        };
    }
}