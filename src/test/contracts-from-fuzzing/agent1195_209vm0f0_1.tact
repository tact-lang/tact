struct Inner {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: String;
    f5: Int as uint16;
    f6: Bool?;
}

struct Outer {
    inner: Inner;
    nestedOpt: Inner?;
    flag: Bool;
    name: String;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{f1:1, f2:2, f3:true, f4:"x", f5:3, f6:false},
            nestedOpt: null,
            flag: false,
            name: "hello"
        };
    }
}
