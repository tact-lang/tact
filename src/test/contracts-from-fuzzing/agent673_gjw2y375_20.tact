// deeply nested optional chain with multiple levels null
struct D3 {
    x: Int?;
}
struct D2 {
    d3: D3?;
}
struct D1 {
    d2: D2?;
}

contract TestContract {
    root: D1;

    init() {
        self.root = D1{
            d2: null
        };
    }
}