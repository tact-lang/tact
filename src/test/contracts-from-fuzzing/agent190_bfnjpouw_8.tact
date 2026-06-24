struct L3 {
    x: Int?;
    y: Bool;
}

struct L2 {
    a: L3;
    s: String?;
}

struct L1 {
    first: Int;
    next: L2;
}

contract TestContract {
    nested: L1;

    init() {
        self.nested = L1{
            first: 1,
            next: L2{
                a: L3{
                    x: null,
                    y: false
                },
                s: null
            }
        };
    }
}