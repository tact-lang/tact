struct NestedManyFields {
    s: String;
    b: Bool;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract TestContract {
    f1: Int = 1;
    f2: String = "";
    f3: Bool = false;
    f4: Address;
    f5: Cell;
    f6: Slice;
    st: NestedManyFields;

    init() {
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.st = NestedManyFields{
            s:"bar", b:true, optInt:null, optBool:null, optStr:null
        };
    }
}