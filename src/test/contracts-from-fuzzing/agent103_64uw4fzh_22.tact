struct D1 {
    x: Int;
    d2: D2;
}

struct D2 {
    y: Int;
    d3: D3;
}

struct D3 {
    z: Int;
}

contract TestContract {
    field: D1;

    init() {
        self.field = D1{ x:1, d2: D2{ y:2, d3: D3{ z:3 } } };
    }
}
