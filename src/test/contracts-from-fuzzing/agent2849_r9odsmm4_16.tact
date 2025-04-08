struct InnerOne {
    x: Int;
    y: Int;
}

struct InnerTwo {
    foo: Bool;
    bar: String;
}

struct Combo {
    first: InnerOne;
    second: InnerTwo;
    opt: InnerTwo?;
}

contract ManyNestedOptional {
    val: Combo;

    init() {
        self.val = Combo{
            first: InnerOne{x:1,y:2},
            second: InnerTwo{foo:true,bar:"hi"},
            opt: null
        };
    }
}