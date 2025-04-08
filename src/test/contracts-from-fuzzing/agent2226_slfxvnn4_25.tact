struct SOne {
    a: Int;
}

struct STwo {
    b: Bool;
    one: SOne;
}

struct SThree {
    two: STwo;
    str: String;
}

contract DeepNesting {
    nested: SThree;
    init() {
        self.nested = SThree{
            two: STwo{
                b:true,
                one: SOne{ a:5 }
            },
            str: "done"
        };
    }
}