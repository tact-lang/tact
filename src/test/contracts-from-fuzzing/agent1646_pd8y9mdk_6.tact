struct NestedMany {
    a: Int;
    b: Bool;
    c: Slice;
}

struct Composed {
    a: NestedMany;
    b: NestedMany;
    c: NestedMany;
}

contract ManyNestedFields {
    data: Composed;
    init() {
        self.data = Composed{
            a: NestedMany{a:1,b:true,c:emptyCell().asSlice()},
            b: NestedMany{a:2,b:false,c:emptyCell().asSlice()},
            c: NestedMany{a:3,b:true,c:emptyCell().asSlice()},
        };
    }
}