struct StructX {
    a: Int;
    b: Bool;
}

struct StructY {
    c: Int;
    d: Bool;
}

contract TestContract {
    sx: StructX;
    sy: StructY;

    init() {
        self.sx = StructX{a:42,b:true};
        self.sy = StructY{c:24,d:false};
    }
}