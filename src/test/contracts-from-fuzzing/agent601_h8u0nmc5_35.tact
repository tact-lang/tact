struct Tiny {
    t: Int as uint4;
}

struct Small {
    s: Tiny?;
}

struct Mid {
    m: Small?;
    direct: Int as uint8;
}

contract DeepImplicitNulls {
    dat: Mid;

    init() {
        self.dat = Mid{
            // omit 'm' entirely, so implicitly null nested optional struct
            direct: 7
        };
    }
}
