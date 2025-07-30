struct Inner {
    num: Int;
    flag: Bool;
    text: String;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
}

contract MultiNested {
    x: Outer;
    init() {
        self.x = Outer{
            a: Inner{num:1, flag:true, text:"a"},
            b: Inner{num:2, flag:false, text:"b"},
            c: Inner{num:3, flag:true, text:"c"}
        };
    }
}
