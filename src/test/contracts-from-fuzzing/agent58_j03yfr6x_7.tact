// Large struct with many types
struct BigStruct {
    intVal: Int;
    intU32: Int as uint32;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    strVal: String;
    optInt: Int?;
    optAddr: Address?;
    mapIntInt: map<Int, Int>;
    mapAddrBool: map<Address, Bool>;
}

contract TestContract {
    bigData: BigStruct;

    init() {
        self.bigData = BigStruct{
            intVal: 1,
            intU32: 2,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            strVal: "test",
            optInt: null,
            optAddr: null,
            mapIntInt: emptyMap(),
            mapAddrBool: emptyMap()
        };
    }
}