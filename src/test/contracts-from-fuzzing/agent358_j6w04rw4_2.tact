struct ManyTypes {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    strVal: String;
    optBool: Bool?;
    optInt: Int?;
    nested: Nested;
}

struct Nested {
    flag: Bool;
    num: Int;
}

contract TestContract {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            intVal: 1,
            boolVal: false,
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            strVal: "hi",
            optBool: null,
            optInt: null,
            nested: Nested{ flag: true, num: 42 },
        };
    }
}