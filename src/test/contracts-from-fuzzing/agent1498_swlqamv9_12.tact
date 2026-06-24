message(11) M1 {
    x: Int;
}

struct S2 {
    y: Bool;
    m: M1?;
}

message(22) M3 {
    z: Int?;
    sub: S2;
}

struct Root {
    deep: M3?;
    val: Int;
}

contract MixNested {
    saved: Root;

    init() {
        self.saved = Root{
            deep: null,
            val: 55,
        };
    }
}