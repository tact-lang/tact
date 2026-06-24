// test deeply optional at all levels
struct D1 { n: Int?; }
struct D2 { n: D1?; }
struct D3 { n: D2?; }
struct D4 { n: D3?; }

contract Test {
    f: D4?;
    init() {
        self.f = null;
    }
}