struct NestedStructs {
    one: StructOne;
    two: StructTwo;
}

struct StructOne {
    foo: Int;
    bar: Bool;
}

struct StructTwo {
    baz: String;
    qux: Address;
}

contract StorageCombos {
    big: NestedStructs;

    init() {
        self.big = NestedStructs{
            one: StructOne{foo:1,bar:true},
            two: StructTwo{baz:"s",qux:myAddress()},
        };
    }
}
