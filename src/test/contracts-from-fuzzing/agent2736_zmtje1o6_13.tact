struct StructOne {
    a: Int;
    b: Bool;
}

struct StructTwo {
    c: String;
    d: StructOne;
}

struct StructThree {
    e: Address;
    f: StructTwo;
}

contract NestedStructsMulti {
    field: StructThree;

    init() {
        self.field = StructThree{
            e: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            f: StructTwo{
                c: "hi",
                d: StructOne{
                    a: 55,
                    b: false
                }
            }
        };
    }
}