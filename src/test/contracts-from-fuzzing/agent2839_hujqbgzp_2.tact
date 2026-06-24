struct Inner {
    val: Int;
    opt: Bool?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract NestedStructFields {
    data: Outer;
    
    init() {
        self.data = Outer{
            nested: Inner{val: 7, opt: null},
            flag: true
        };
    }
}