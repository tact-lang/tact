struct LargeNested {
    nested1: String;
    nested2: Int;
    nested3: Bool;
    nested4: String;
    nested5: Int;
    nested6: Bool;
    nested7: String;
    nested8: Int;
    nested9: Bool;
    nested10: String;
}

contract ManyFieldsAllTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: LargeNested;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "test";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = myAddress();
        self.h = LargeNested{
            nested1:"a", nested2:1, nested3:true, nested4:"b", nested5:2,
            nested6:false, nested7:"c", nested8:3, nested9:true, nested10:"d"
        };
    }
}