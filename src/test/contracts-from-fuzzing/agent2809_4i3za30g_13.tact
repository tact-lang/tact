struct MyStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract ComplexStorage {
    s1: MyStruct;
    s2: MyStruct;

    init() {
        self.s1 = MyStruct{ a:1, b:true, c:"x", d: myAddress(), e: emptyCell(), f: emptyCell().asSlice(), g: beginCell() };
        self.s2 = MyStruct{ a:2, b:false, c:"y", d: myAddress(), e: emptyCell(), f: emptyCell().asSlice(), g: beginCell() };
    }
}