struct SubInner {
    z: Int;
}

struct Inner {
    x: Int;
    sub: SubInner?;
}

contract OptionalNestedStruct {
    innerOpt: Inner?; 

    init() {
        self.innerOpt = Inner{
            x: 7,
            sub: SubInner{z: 77},
        };
    }
}