struct Deep {
    a: Int;
    b: Int;
    c: Int;
}

contract DeepDefaults {
    withDefaults: Deep = Deep{
        a: 1,
        b: 2,
        c: 3
    };

    init() {
        self.withDefaults = Deep{
            a: 10,
            b: 20,
            c: 30
        };
    }
}