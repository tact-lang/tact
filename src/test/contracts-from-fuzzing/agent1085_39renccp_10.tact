struct InnerLevel2 {
    z: Int;
    w: Bool;
    t: String?;
}

struct InnerLevel1 {
    a: Int;
    b: Bool;
    inner: InnerLevel2;
}

contract TestContract {
    data: InnerLevel1;

    init() {
        self.data = InnerLevel1{
            a: 42,
            b: true,
            inner: InnerLevel2{
                z: 1,
                w: false,
                t: null
            }
        };
    }
}