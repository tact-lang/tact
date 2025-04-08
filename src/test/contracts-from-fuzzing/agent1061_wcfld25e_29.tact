// intentionally make a very deep nested optional struct chain
struct D4 { val: Int; }
struct D3 { d4: D4?; }
struct D2 { d3: D3?; }
struct D1 { d2: D2?; }

contract Test {
    nest: D1?;

    init() {
        self.nest = D1{
            d2: D2{
                d3: null
            }
        };
    }
}