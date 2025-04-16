struct Complex {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct Wrapper {
    inner: Complex;
    flag: Bool;
    note: String;
}

contract TestContract {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            inner: Complex{ a:1,b:"x",c:true,d:null,e:null,f:null },
            flag:true, note:"demo"
        };
    }
}