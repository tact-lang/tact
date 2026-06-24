// Test many nested structs with many optional layers mixed
struct D3 {
    v: Int?;
}
struct D2 {
    d3: D3?;
}
struct D1 {
    d2: D2?;
}

contract MultiLevelOptMix {
    nested: D1;
    init() {
        self.nested = D1{ d2: null };
    }
}