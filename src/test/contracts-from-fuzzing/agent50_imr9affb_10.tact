struct Tiny {
    small: Int as uint8;
    medium: Int as int64;
}

contract SerializeNested {
    val: Tiny;

    init() {
        self.val = Tiny{
            small: 1,
            medium: 1000,
        };
    }
}