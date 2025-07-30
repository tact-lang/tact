struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
}

struct S2 {
    s: S1;
    b: Bool;
    n: Int;
    str: String;
}

contract ListNested {
    data: S2;

    init() {
        self.data = S2{
            s: S1{a:1,b:true,c:"s",d:emptyCell(),e:emptyCell().asSlice()},
            b: false,
            n: 33,
            str: "hi"
        };
    }
}