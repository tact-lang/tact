struct Inner {
    a: Int = 1;
    b: Bool = false;
}

struct Outer {
    optInt: Int?;
    optStr: String?;
    inner: Inner;
}

contract StructStorage {
    data: Outer;

    init() {
        self.data = Outer{
            optInt: 5,
            optStr: null,
            inner: Inner{
                a: 10,
                b: true
            }
        };
    }
}