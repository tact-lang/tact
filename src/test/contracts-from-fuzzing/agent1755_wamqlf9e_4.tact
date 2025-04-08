struct NestedOptional {
    a: Int?;
    b: String?;
}

struct Outer {
    i: Int;
    nested: NestedOptional;
    s: String;
}

contract NestedStructOpt {
    val: Outer;
    
    init() {
        self.val = Outer{
            i: 123,
            nested: NestedOptional{
                a: null,
                b: null
            },
            s: "hello"
        };
    }
}