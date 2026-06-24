struct NestedComplex {
    intVal: Int;
    optVal: Int?;
    strVal: String;
    optStr: String?;
    boolVal: Bool;
    optBool: Bool?;
    sliceVal: Slice;
    optSlice: Slice?;
    cellVal: Cell;
    optCell: Cell?;
}

contract NestedComplexTest {
    val: NestedComplex;
    init() {
        self.val = NestedComplex{
            intVal:1,optVal:null,strVal:"s",optStr:null,
            boolVal:true,optBool:null,sliceVal:emptyCell().asSlice(),optSlice:null,
            cellVal:emptyCell(),optCell:null
        };
    }
}