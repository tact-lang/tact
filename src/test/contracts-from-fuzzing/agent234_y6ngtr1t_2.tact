struct Inner {
    field1: Int;
    field2: String;
}

struct Outer {
    nested: Inner;
    optNested: Inner?;
    someInt: Int;
    someStr: String;
}

contract ComplexContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{field1:1, field2:"abc"},
            optNested: null,
            someInt: 5,
            someStr: "test"
        };
    }
}