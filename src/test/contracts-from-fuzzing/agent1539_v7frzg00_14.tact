struct Cross {
    a: Int;
    b: CrossSub1;
    c: CrossSub2;
}

struct CrossSub1 {
    d: Int;
    e: Bool;
}

struct CrossSub2 {
    f: String;
    g: Bool?;
}

contract CrossRef {
    val: Cross;
    init() {
        self.val = Cross{
            a:1,
            b: CrossSub1{d:2,e:true},
            c: CrossSub2{f:"hi",g:null}
        };
    }
}