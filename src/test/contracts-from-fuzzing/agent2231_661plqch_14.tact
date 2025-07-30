struct MultipleNestedStructs {
    first: InnerOne;
    second: InnerTwo;
}

struct InnerOne {
    foo: Int;
    flag: Bool;
}

struct InnerTwo {
    x: String?;
    y: Int;
}

contract NestedStructsMix {
    complex: MultipleNestedStructs;

    init() {
        self.complex = MultipleNestedStructs{
            first: InnerOne{
                foo:10, flag:true
            },
            second: InnerTwo{
                x:null, y:20
            }
        };
    }
}