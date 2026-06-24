struct Arr1 {
    a: Int;
    b: Bool;
}
struct Arr2 {
    c: Int;
    d: Slice;
}
struct Arr3 {
    e: Address;
    f: Cell;
}

struct LongList {
    x1: Arr1;
    x2: Arr2;
    x3: Arr3;
    y1: Arr1;
    y2: Arr2;
    y3: Arr3;
    z1: Arr1;
    z2: Arr2;
    z3: Arr3;
}

contract WideStructs {
    foo: LongList;
    init() {
        self.foo = LongList{
            x1: Arr1{a:1,b:true},
            x2: Arr2{c:2,d:emptyCell().asSlice()},
            x3: Arr3{e:myAddress(),f:emptyCell()},
            y1: Arr1{a:3,b:true},
            y2: Arr2{c:4,d:emptyCell().asSlice()},
            y3: Arr3{e:myAddress(),f:emptyCell()},
            z1: Arr1{a:5,b:false},
            z2: Arr2{c:6,d:emptyCell().asSlice()},
            z3: Arr3{e:myAddress(),f:emptyCell()},
        };
    }
}