struct ComposeMulti {
    a: Int;
    b: Bool;
    c: Slice;
}

contract ComposeBig {
    var1: ComposeMulti;
    var2: ComposeMulti;
    var3: ComposeMulti;

    init() {
        self.var1 = ComposeMulti{ a:1, b:true, c:emptyCell().asSlice() };
        self.var2 = ComposeMulti{ a:2, b:false, c:emptyCell().asSlice() };
        self.var3 = ComposeMulti{ a:3, b:true, c:emptyCell().asSlice() };
    }
}