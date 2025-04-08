struct L3 {
    i: Int;
    b: Bool?;
    s: String?;
}

struct L2 {
    nest: L3?;
    x: Int?;
}

struct L1 {
    inner: L2?;
    flag: Bool;
}

contract OptNest {
    data: L1?;

    init() {
        self.data = L1{
            inner: L2{
                nest: L3{
                    i: 42,
                    b: null,
                    s: null
                },
                x: null
            },
            flag: true
        };
    }
}