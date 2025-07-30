struct TupleNested {
    x: Int;
    y: Int?;
}

struct InnerNested {
    a: Int;
    b: Int?;
    t: TupleNested;
}

struct NestedOptional {
    field1: Int?;
    inner: InnerNested?;
}

contract TestDeepNestedOptionals {
    receive(msg: Slice) {
        let value: NestedOptional = NestedOptional{
            field1: 10,
            inner: InnerNested{
                a: 20,
                b: null,
                t: TupleNested{
                    x: 30,
                    y: 40
                }
            }
        };
    }
}
