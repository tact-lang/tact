struct LargeStructNested {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    s1: InnerStructA;
    s2: InnerStructB;
}

struct InnerStructA {
    x: Int;
    y: Bool;
}

struct InnerStructB {
    z: String;
    w: Bool;
}

contract LargeNestedStructTest {
    big: LargeStructNested;

    init() {
        self.big = LargeStructNested{
            a1: 1,
            a2: 2,
            a3: 3,
            a4: 4,
            a5: 5,
            s1: InnerStructA{
                x: 100,
                y: true,
            },
            s2: InnerStructB{
                z: "zzz",
                w: false,
            },
        };
    }
}