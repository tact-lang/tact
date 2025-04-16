// Deeply nested with optional node in the middle

struct D3 {
    leaf: String;
}

struct D2 {
    mid: D3?;
}

struct D1 {
    root: D2;
}

contract TestContract {
    nested: D1;

    init() {
        self.nested = D1{
            root: D2{
                mid: null
            }
        };
    }
}