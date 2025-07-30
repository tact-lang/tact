struct T {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
    optInt: Int?;
    optStruct: U?;
    mapVal: map<Int, Bool>;
}

struct U {
    x: Int;
    y: String;
}

contract MixedFields {
    data: T;

    init() {
        self.data = T{
            intVal: 1,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "hi",
            optInt: null,
            optStruct: null,
            mapVal: emptyMap(),
        };
    }
}