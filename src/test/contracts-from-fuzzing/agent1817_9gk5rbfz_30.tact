// Test optional as last field
struct LastOptional {
    a: Int;
    opt: Cell?;
}

contract LastOptionalTest {
    f: LastOptional;

    init() {
        self.f = LastOptional{a:1, opt:null};
    }
}
