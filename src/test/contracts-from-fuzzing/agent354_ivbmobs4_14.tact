struct Tiny {
    f: Int as uint1;
    b: Bool;
}

contract TinyTypesTest {
    t: Tiny;

    init() {
        self.t = Tiny{f:1,b:true};
    }
}