struct InnerStruct {
    foo: Int;
    bar: Bool;
}

struct OuterStruct {
    payload: Cell;
    nested: InnerStruct;
}

contract StructWithCell {
    d: OuterStruct;

    init() {
        self.d = OuterStruct{
            payload: emptyCell(),
            nested: InnerStruct{ foo: 9, bar: true }
        };
    }
}
