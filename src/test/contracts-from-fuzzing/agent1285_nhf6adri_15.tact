// Deep nesting with optionals combined
struct D1 {
    val: Int?;
}

struct D2 {
    d1: D1?;
}

struct D3 {
    d2: D2?;
}

contract TestContract {
    nestedOpt: D3?;
    init() {
        self.nestedOpt = D3{
            d2: D2{
                d1: null
            }
        };
    }
}