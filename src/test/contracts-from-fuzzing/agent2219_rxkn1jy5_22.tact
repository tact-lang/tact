struct AA { a: Int; }
struct BB { b: Int; }
struct CC { c: Int; }
struct DD { d: Int; }

contract ManyNested {
    aa: AA;
    bb: BB;
    cc: CC;
    dd: DD;

    init() {
        self.aa = AA{ a:11 };
        self.bb = BB{ b:22 };
        self.cc = CC{ c:33 };
        self.dd = DD{ d:44 };
    }
}