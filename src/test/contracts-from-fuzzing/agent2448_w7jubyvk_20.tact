struct NestedStr {
    s1: String;
    s2: String;
    s3: String;
}

struct NestedInt {
    a: Int;
    b: Int;
    c: Int;
}

struct Wrapper {
    innerS: NestedStr;
    innerI: NestedInt;
}

contract WrapNested {
    w: Wrapper;
    
    init() {
        self.w = Wrapper{
            innerS: NestedStr{
                s1: "1",
                s2: "2",
                s3: "3",
            },
            innerI: NestedInt{
                a: 10,
                b: 20,
                c: 30,
            },
        };
    }
}
