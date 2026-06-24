struct Middle {
    a: Int;
    b: Bool;
    c: Inner;
}

struct Inner {
    str: String;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    note: String?;
}

contract NestedMixed {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{a:5,b:true,c:Inner{str:"x",flag:false}},
            note: null
        };
    }
}
