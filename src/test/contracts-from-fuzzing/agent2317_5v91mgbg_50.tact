struct Base {
    a: Int;
    b: Bool;
}

struct Middle {
    m: Base;
}

struct Top {
    top: Middle;
}

contract LayerCake {
    field: Top;

    init() {
        self.field = Top{top:Middle{m:Base{a:3,b:true}}};
    }
}