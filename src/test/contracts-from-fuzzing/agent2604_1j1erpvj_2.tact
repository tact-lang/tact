struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
    sliceVal: Slice;
    cellVal: Cell;
    nested: InnerInner;
}

struct InnerInner {
    a: Int;
    b: Bool;
    c: String;
}

contract DeepNestingTest {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner: InnerStruct{
                intVal: 1,
                strVal: "a",
                boolVal: true,
                sliceVal: emptyCell().asSlice(),
                cellVal: emptyCell(),
                nested: InnerInner{
                    a: 2,
                    b: false,
                    c: "b",
                }
            }
        };
    }
}