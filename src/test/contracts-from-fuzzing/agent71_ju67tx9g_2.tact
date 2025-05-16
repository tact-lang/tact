struct ManyFields {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    flag: Bool;
    text: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract ManyTypesTest {
    record: ManyFields;

    init() {
        self.record = ManyFields{
            int1: 1, int2: 2, int3: 3, int4: 4, int5: 5,
            flag: true,
            text: "hello",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
        };
    }

    receive() {
        self.record;
    }
}