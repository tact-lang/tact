struct Wrapper {
    d: Data;
}

struct Data {
    a: Int;
    b: Int?;
    c: Bool;
}

contract WrapOpt {
    w: Wrapper;
    init() {
        self.w = Wrapper{
            d: Data{ a:1, b:null, c:true }
        };
    }
}