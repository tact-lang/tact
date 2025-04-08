struct Tiny {
    a: Int as uint4;
    b: Int as int3;
}

struct Big {
    x: Int as int257;
    t: Tiny;
}

contract Test {
    val: Big;
    init() {
        self.val = Big{
            x: 12345,
            t: Tiny{
                a: 7,
                b: -1,
            },
        };
    }
}
