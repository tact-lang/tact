struct Nested {
    optBool: Bool?;
    optInt: Int?;
    optNested: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    d: Nested;
    init() {
        self.d = Nested{ optBool:true, optInt:null, optNested:null };
    }
}