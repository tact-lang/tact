struct SOptDeep {
    oo: L1?;
}

struct L1 {
    l2: L2?;
}

struct L2 {
    foo: Int?;
    bar: Bool?;
}

contract DeepOptionals {
    val: SOptDeep;

    init() {
        self.val = SOptDeep{
            oo: L1{
                l2: L2{
                    foo: 7,
                    bar: null,
                },
            },
        };
    }
}
