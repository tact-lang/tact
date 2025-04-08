struct A {
    a: Int;
    b: Bool;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice;
    g: Builder;
    h: String;
    i: Bool;
    j: Int;
}

contract ManyTypes {
    field: A;

    init() {
        self.field = A{
            a:0, b:false, c:"", d:null, 
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: "", i:false, j:0
        };
    }
}