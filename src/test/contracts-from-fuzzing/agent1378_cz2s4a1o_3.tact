struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    c: Int;
    d: Inner;
}

contract NestOpt {
    s: Outer = Outer{c:5,d:Inner{a:7,b:null}};
    init() {
        self.s = Outer{c:10,d:Inner{a:3,b:true}};
    }
    receive() {}
}