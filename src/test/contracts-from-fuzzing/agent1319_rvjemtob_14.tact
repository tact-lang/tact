struct LargeNested_A {
    x: Int;
    y: Int;
    z: Int;
}

struct LargeNested_B {
    a: LargeNested_A;
    b: Int;
}

struct LargeNested_C {
    d: LargeNested_B;
    e: Int;
}

struct LargeNested_D {
    f: LargeNested_C;
    g: Int;
}

contract DeepLargeNestedTest {
    storage: LargeNested_D;

    init() {
        self.storage = LargeNested_D{
            f: LargeNested_C{
                d: LargeNested_B{
                    a: LargeNested_A{ x:1,y:2,z:3 },
                    b:4
                },
                e:5
            },
            g:6
        };
    }
}