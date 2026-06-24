// deep optional nested with partial filling
struct D3 {
    a: Int?;
}
struct D2 {
    d3: D3?;
}
struct D1 {
    d2: D2?;
}
contract DeepOpt {
    state: D1;
    init() {
        self.state = D1{
            d2: D2{
                d3: null
            }
        };
    }
}