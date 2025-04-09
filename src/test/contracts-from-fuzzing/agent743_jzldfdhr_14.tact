struct Tiny {
    val: Int?;
    flag: Bool?;
}

struct Mid {
    t: Tiny?;
    val2: Int?;
}

struct Big {
    m: Mid?;
    s: String?;
    addr: Address?;
    b: Bool?;
}

contract DeepCrazyOptional {
    big: Big;

    init() {
        self.big = Big{
            m: Mid{
                t: Tiny{
                    val: null,
                    flag: null
                },
                val2: null
            },
            s: null,
            addr: null,
            b: null
        };
    }
}