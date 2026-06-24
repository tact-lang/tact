struct Large {
    a: Int;
    b: Bool;
    c: Cell;
    d: String;
    e: Slice;
}

contract TestContract {
    var1: Large;
    var2: Large;

    init() {
        self.var1 = Large{a:1,b:true,c:emptyCell(),d:"x",e:emptyCell().asSlice()};
        self.var2 = Large{a:2,b:false,c:emptyCell(),d:"y",e:emptyCell().asSlice()};
    }
}