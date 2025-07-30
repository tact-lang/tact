struct MixDefaultInit {
    a: Int = 1;
    b: Int;
    c: Bool = false;
    d: Bool;
}

contract StructWithMixDefaults {
    v: MixDefaultInit;

    init() {
        self.v = MixDefaultInit{
            b: 5,
            d: true,
            a: 10,
            c: true
        };
    }
}