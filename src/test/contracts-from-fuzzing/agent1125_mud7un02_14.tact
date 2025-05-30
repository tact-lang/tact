struct SerializeVariants {
    small: Int as uint4;
    mid: Int as uint32;
    large: Int as int257;
}

contract TestContract {
    s: SerializeVariants;

    init() {
        self.s = SerializeVariants{
            small: 5,
            mid: 1000,
            large: -123456789,
        };
    }
}