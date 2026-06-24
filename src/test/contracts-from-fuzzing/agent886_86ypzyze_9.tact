struct Arr {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract TestContract {
    var1: Arr;
    var2: Arr;
    var3: Arr;
    init() {
        self.var1 = Arr{a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"one"};
        self.var2 = Arr{a:2,b:false,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"two"};
        self.var3 = Arr{a:3,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"three"};
    }
}