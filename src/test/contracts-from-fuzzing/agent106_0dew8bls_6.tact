struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Slice;
    f5: Cell;
    f6: Builder;
    f7: String;
    f8: Int?;
    f9: Bool;
    f10: String;
}

contract ManyStructField {
    foo: LongStruct;

    init() {
        self.foo = LongStruct{
            f1:1,f2:true,f3:myAddress(),f4:emptyCell().asSlice(),f5:emptyCell(),
            f6:beginCell(),f7:"hi",f8:null,f9:false,f10:"bye"
        };
    }

    receive() {
        self.foo = self.foo;
    }
}