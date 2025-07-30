struct S1 {
    a: Int as int64;
    b: String?;
}

struct S2 {
    x: Int as uint32;
    y: S1;
}

contract SerializeNested {
    data: S2;

    init() {
        self.data = S2{
            x: 123,
            y: S1{
                a: -456,
                b: null
            }
        };
    }
}
