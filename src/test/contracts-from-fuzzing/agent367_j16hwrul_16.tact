// test persistence of struct with many nested optionals, defaults omitted deliberately
struct OptNest {
    a: Int?;
    b: Bool?;
    s: Inner?;
}

struct Inner {
    x: Int?;
    y: Bool?;
    note: String?;
}

contract OptNestTest {
    data: OptNest;
    init() {
        self.data = OptNest{ a:null, b:null, s:null };
    }
}