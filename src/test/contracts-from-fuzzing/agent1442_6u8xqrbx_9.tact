struct Nested {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    b1: Bool;
    str: String;
    optStr: String?;
}

contract TestContract {
    data: Nested;
    init() {
        self.data = Nested{
            inner1: Inner{b1:true, str:"a", optStr:null},
            inner2: Inner{b1:false, str:"b", optStr:null}
        };
    }
}