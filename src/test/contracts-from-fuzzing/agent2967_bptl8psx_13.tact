struct Tertiary {
    u: Int;
    v: Bool;
}

struct Secondary {
    r: Int;
    s: Tertiary;
}

struct Primary {
    p: Bool;
    q: Secondary;
}

contract TripleNested {
    data: Primary;

    init() {
        self.data = Primary{
            p: true,
            q: Secondary{
                r: 5,
                s: Tertiary{u:10,v:false}
            }
        };
    }
}