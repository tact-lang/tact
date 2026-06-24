struct Sub {
    a: Int;
}

struct S {
    f1: Int;
    f2: Bool;
    f3: Bool?;
    f4: Sub;
    f5: Sub?;
    f6: String;
    f7: String?;
    f8: Cell;
    f9: Slice;
    f10: Address;
}

contract TestContract {
    storage: S;

    init() {
        self.storage = S{
            f1:1, f2:true, f3:null, f4:Sub{a:5}, f5:null, f6:"str", f7:null, f8:emptyCell(), f9:emptyCell().asSlice(), f10:myAddress()
        };
    }
}
