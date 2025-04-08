contract MessManyTypes {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: Address?;
    f10: Cell?;
    f11: Slice?;
    f12: String?;

    init() {
        self.f1=1;self.f2=true;self.f3=myAddress();self.f4=emptyCell();self.f5=emptyCell().asSlice();self.f6="";
        self.f7=null;self.f8=null;self.f9=null;self.f10=null;self.f11=null;self.f12=null;
    }
}