struct A { a:Int; }
struct B { b: Int; }
struct C {
    aa: A;
    bb: B;
    s: String;
    opt: Int?;
    flag: Bool;
    opt2: Bool?;
}

contract Mixes {
    data: C;

    init() {
        self.data = C{
            aa: A{a:1},
            bb: B{b:2},
            s: "hi",
            opt: null,
            flag: true,
            opt2: false,
        };
    }
}