struct Flat {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
}

struct Wrap1 {
    inner: Flat;
}

struct Wrap2 {
    inner: Wrap1;
}

contract FlatInDeepWrapper {
    w: Wrap2;

    init() {
        self.w = Wrap2{ inner: Wrap1{ inner: Flat{ a:1, b:2, c:true, d:false } } };
    }
}