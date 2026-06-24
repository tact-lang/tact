struct NestedStructsA {
    a: Int;
    b: NestedStructsB;
}

struct NestedStructsB {
    c: Int;
    d: NestedStructsC;
}

struct NestedStructsC {
    e: Int;
    f: NestedStructsD;
}

struct NestedStructsD {
    g: Int;
    h: String;
}

contract DeepNestStructsTest {
    val: NestedStructsA;

    init() {
        self.val = NestedStructsA{
            a: 1,
            b: NestedStructsB{
                c: 2,
                d: NestedStructsC{
                    e: 3,
                    f: NestedStructsD{
                        g: 4,
                        h: "hi"
                    }
                }
            }
        };
    }
}
