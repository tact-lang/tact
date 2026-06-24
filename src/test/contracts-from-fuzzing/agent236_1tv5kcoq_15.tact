struct Middle1 {
    a: Int;
    b: Bool;
}

struct Middle2 {
    c: String;
    d: Slice;
}

struct NestedMultiple {
    one: Middle1;
    two: Middle2;
}

contract MultiNestedStructs {
    data: NestedMultiple;

    init() {
        self.data = NestedMultiple{
            one: Middle1{a:1,b:true},
            two: Middle2{c:"x",d:emptyCell().asSlice()}
        };
    }
}