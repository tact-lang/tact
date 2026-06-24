struct Tiny { flag: Bool }

struct Outer {
    a: Int;
    b: Bool;
    t: Tiny;
}

contract TinyNested {
    dat: Outer;

    init() {
        self.dat = Outer{ a:5, b:true, t: Tiny{ flag:false } };
    }
}