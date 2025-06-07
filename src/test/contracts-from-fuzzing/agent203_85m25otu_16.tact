struct S {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
}

contract TestContract {
    a: S;
    b: S;
    c: S;

    init() {
        self.a = S{
            f1:1, f2:true, f3:myAddress(), f4:emptyCell(), f5:emptyCell().asSlice(), f6:"a"
        };
        self.b = S{
            f1:2, f2:false, f3:myAddress(), f4:emptyCell(), f5:emptyCell().asSlice(), f6:"b"
        };
        self.c = S{
            f1:3, f2:true, f3:myAddress(), f4:emptyCell(), f5:emptyCell().asSlice(), f6:"c"
        };
    }
}