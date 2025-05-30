struct Inner {
    a: Int;
    b: Bool;
    c: Address;
}

struct Outer {
    nested: Inner;
    count: Int = 123;
    message: String;
    opt: Bool?;
}

contract Container {
    s: Outer;
    init() {
        self.s = Outer{
            nested: Inner{a:1,b:true,c:myAddress()},
            message: "msg",
            opt: null,
        };
    }
}