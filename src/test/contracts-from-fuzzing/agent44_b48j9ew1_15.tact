struct SInner {
    v1: Int;
    v2: Bool;
}

struct SMid {
    s1: SInner;
    s2: SInner;
}

struct SOuter {
    mid: SMid;
    val: Int;
}

contract NestedStructs {
    field: SOuter;

    init() {
        self.field = SOuter{
            mid: SMid{
                s1: SInner{ v1: 1, v2: false },
                s2: SInner{ v1: 2, v2: true }
            },
            val: 5
        };
    }

    receive() {
        let _ = self.field.mid.s1.v2;
    }
}