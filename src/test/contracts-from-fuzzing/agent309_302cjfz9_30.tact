struct BigNested {
    sub1: NestedA;
    sub2: NestedB;
}

struct NestedA {
    foo: Int;
    bar: Bool;
}

struct NestedB {
    baz: String;
    addr: Address;
}

contract BigNestedFields {
    field: BigNested;

    init() {
        self.field = BigNested{
            sub1: NestedA{foo:5,bar:true},
            sub2: NestedB{baz:"hi",addr:myAddress()}
        };
    }
}