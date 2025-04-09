// Deep nesting with some default values
struct D4 { val: Int = 4; }
struct D3 { d4: D4; }
struct D2 { d3: D3; }
struct D1 { d2: D2; }

contract DefaultsDeep {
    field: D1;

    init() {
        self.field = D1{ d2: D2{ d3: D3{ d4: D4{} } } };
    }
}