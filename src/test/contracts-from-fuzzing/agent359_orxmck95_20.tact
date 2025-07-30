struct L3 {
    foo: Int?;
}

struct L2 {
    bar: L3?;
    s: String?;
}

struct L1 {
    nested: L2?;
    b: Bool?;
}

contract TestContract {
    deepState: L1;

    init() {
        self.deepState = L1{
            nested: L2{ bar: null, s: null },
            b: null
        };
    }
}