struct Small1 { x: Int }
struct Small2 { y: Bool }

struct Mid {
    m1: Small1;
    m2: Small2;
}

struct Big {
    mid: Mid;
    z: Int?;
    str: String;
}

contract TestContract {
    big: Big;

    init() {
        self.big = Big{
            mid: Mid{
                m1: Small1{ x: 7 },
                m2: Small2{ y: true },
            },
            z: null,
            str: "s",
        };
    }
}