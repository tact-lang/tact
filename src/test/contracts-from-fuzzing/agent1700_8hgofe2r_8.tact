struct Some {
    a: Int;
    b: String;
}

struct Many {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Some;
    f8: Bool;
    f9: Int?;
    f10: String?;
}

contract TestContract {
    big: Many;

    init() {
    self.big = Many{
        f1: 1, f2:true, f3:"s", f4:myAddress(), f5:emptyCell(),
        f6:emptyCell().asSlice(), f7: Some{a:9,b:"b"}, f8:false,
        f9:null, f10:null
    };
    }
}