struct Sub {
    a:Int;
    b:Int;
}

struct Middle {
    x:Int;
    s:Sub;
}

struct Wrapper {
    w:Middle;
}

contract NestedStructs {
    x:Wrapper;
    init() {
        self.x = Wrapper{ w:Middle{ x:8, s:Sub{ a:1,b:2 } } };
    }
}