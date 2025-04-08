struct SDeep {
    a: Int;
    s: SInner;
}

struct SInner {
    b: Int;
    s2: SInner2;
}

struct SInner2 {
    c: Int;
    flag: Bool;
}

contract DeepStructTest {
    d: SDeep;

    init() {
        self.d = SDeep{
            a: 10,
            s: SInner{
                b: 20,
                s2: SInner2{
                    c: 30,
                    flag: true,
                },
            },
        };
    }
}
