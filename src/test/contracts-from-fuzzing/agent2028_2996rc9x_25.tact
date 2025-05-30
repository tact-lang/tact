struct D1 { v: Int }
struct D2 { v: D1 }
struct D3 { v: D2 }
struct D4 { v: D3 }
struct D5 { v: D4 }

contract FiveDeep {
    data: D5;

    init() {
        self.data = D5{ v: D4{ v: D3{ v: D2{ v: D1{ v: 999 } } } } };
    }
}
