// Test whether structs nested within optionals, deeply nested
struct D3 {
    num: Int;
}

struct D2 {
    d3: D3?;
}

struct D1 {
    d2: D2?;
}

contract DeepOptNest {
    state: D1;

    init() {
        self.state = D1{
            d2: D2{
                d3: null
            }
        };
    }
}