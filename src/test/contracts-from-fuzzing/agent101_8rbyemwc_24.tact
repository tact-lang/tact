struct Many {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Slice?;
}

contract TestContract {
    data: Many;
    init() {
        self.data = Many{
            a:1, b:true, c:"c", d:emptyCell(), e:emptyCell().asSlice(),
            f: null, g: null, h: null, i: null, j: null
        };
    }
}