// test mutually nested structs (non-circular)
struct StructA {
    foo: Int;
    b: StructB;
}

struct StructB {
    bar: Bool;
    c: StructC;
}

struct StructC {
    baz: String;
}

contract TestNestedNonCircular {
    data: StructA;

    init() {
        self.data = StructA{
            foo: 1,
            b: StructB{
                bar: false,
                c: StructC{baz:"demo"}
            }
        };
    }
}