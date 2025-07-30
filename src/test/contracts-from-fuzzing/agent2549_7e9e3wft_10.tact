struct NestedIntOpt {
    a: Int?;
    b: Bool;
}

struct Middle {
    inner: NestedIntOpt?; 
    s: String; 
}

contract OptionalInside {
    field: Middle;
    
    init() {
        self.field = Middle{
            inner: NestedIntOpt{
                a: null,
                b: false
            },
            s: "hello"
        };
    }
}