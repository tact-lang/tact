struct InnerStruct { innerVal: Int; }

contract ManyFields {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    addr: Address;
    str: String;
    flag: Bool;
    cell: Cell;
    slice: Slice;
    builder: Builder;
    nested: InnerStruct;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;
        self.int5 = 5;
        self.addr = myAddress();
        self.str = "test";
        self.flag = true;
        self.cell = emptyCell();
        self.slice = self.cell.asSlice();
        self.builder = beginCell();
        self.nested = InnerStruct{ innerVal: 42 };
    }
}