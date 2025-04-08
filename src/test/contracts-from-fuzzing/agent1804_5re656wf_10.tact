struct AllTypesStruct {
    x: Int;
    y: Int?;
    bl: Bool;
    s: String;
    c: Cell;
    a: Address;
}

contract MultiTypeFields {
    data: AllTypesStruct;

    init() {
        self.data = AllTypesStruct{
            x:1, y:null, bl:true, s:"hey", c:emptyCell(), a:myAddress()
        };
    }
}