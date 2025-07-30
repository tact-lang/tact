// deeply nested optional structure with mix of null and values
struct D3 {
    v: Int?;
}
struct D2 {
    d3: D3?;
}
struct D1 {
    d2: D2?;
}

contract Test {
    root: D1;

    init() {
        self.root = D1{
            d2: D2{
                d3: null
            }
        };
    }
}