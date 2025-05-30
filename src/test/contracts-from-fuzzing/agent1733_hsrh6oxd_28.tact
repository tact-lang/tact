struct Nested {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: String?;
}

struct Wrapper {
    inner: Nested;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: Nested{
                f1:1,f2:true,f3:myAddress(),f4:emptyCell(),
                f5:emptyCell().asSlice(),f6:"str",
                f7:null,f8:null,f9:null
            }
        };
    }
}