struct Deep {
    z: Int;
}

struct Mid {
    inner: Deep?;
}

struct Top {
    middle: Mid?;
}

contract DeepOptional {
    val: Top = Top{ middle: null };

    init() {
        self.val = Top{ middle: Mid{ inner: Deep{ z: 99 } } };
    }
}