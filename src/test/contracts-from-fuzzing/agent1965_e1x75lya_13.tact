struct WideNested {
    x: Inner1;
    y: Inner2;
    z: Inner3;
}

struct Inner1 {
    flag: Bool;
    s: String;
}

struct Inner2 {
    num: Int;
    c: Cell;
}

struct Inner3 {
    sl: Slice;
    addr: Address;
}

contract WideStructNest {
    data: WideNested;
    init() {
        self.data = WideNested{
            x: Inner1{flag:true,s:"x"},
            y: Inner2{num:42,c:emptyCell()},
            z: Inner3{sl:emptyCell().asSlice(),addr:myAddress()}
        };
    }
}