struct InnerOne {
    a: Int;
}

struct InnerTwo {
    b: Bool;
}

struct CrossNested {
    one: InnerOne;
    two: InnerTwo;
}

contract CrossNestedFieldTest {
    data: CrossNested;

    init() {
        self.data = CrossNested{
            one: InnerOne{a:123},
            two: InnerTwo{b:true}
        };
    }
}