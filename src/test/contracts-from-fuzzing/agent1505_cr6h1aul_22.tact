struct LayeredOpt {
    a: Int?;
    b: Int?;
    c: Bool?;
}

struct S2 {
    i: Int;
    inner: LayeredOpt;
}

contract ComboTest {
    x: S2;
    init() {
        self.x = S2{ i: 1, inner: LayeredOpt{ a:null,b:null,c:null } };
    }
}