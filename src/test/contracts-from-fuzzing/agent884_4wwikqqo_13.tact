struct ManyTypesStruct {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
    c: Cell;
}

contract StructField {
    data: ManyTypesStruct;

    init() {
        self.data = ManyTypesStruct{
            i:1, b:true, a:myAddress(), s:"hi", c:emptyCell()
        };
    }
}