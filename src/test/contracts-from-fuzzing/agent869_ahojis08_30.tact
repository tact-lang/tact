struct AA {
    x: Int;
    y: Bool;
    s: String;
}

struct BB {
    a: AA;
    b: AA;
    c: Int;
}

contract Test {
    v: BB;

    init() {
        self.v = BB{
            a: AA{x:1,y:true,s:"foo"},
            b: AA{x:2,y:false,s:"bar"},
            c: 3
        };
    }
}