struct MyStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

struct Wrapper {
    item: MyStruct;
}

contract WrapTest {
    w: Wrapper;
    init() {
        self.w = Wrapper{item: MyStruct{a:1,b:true,c:"xx",d:emptyCell(),e:emptyCell().asSlice(),f:myAddress()}};
    }
}