struct D1 { a: Int }
struct D2 { a: D1 }
struct D3 { a: D2 }
struct D4 { a: D3 }

contract Deep {
    x: D4;
    init() {
        self.x = D4{ a: D3{ a: D2{ a: D1{ a: 123 }}}};
    }
}
