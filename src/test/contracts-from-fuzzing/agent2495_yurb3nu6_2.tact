struct DeepInner {
    flag: Bool;
    count: Int;
}

struct Middle {
    a: DeepInner;
    b: Int?;
}

struct Outer {
    m: Middle;
    z: Bool;
}

contract DeepNestTest {
    dat: Outer;
    
    init() {
        self.dat = Outer{
            m: Middle{
                a: DeepInner{ flag: true, count: 7 },
                b: null
            },
            z: false
        };
    }
}