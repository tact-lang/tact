// Struct with many nested persistent primitive+default+optionals
struct Mega {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
}

contract MegaTest {
    m: Mega;

    init() {
        self.m = Mega{
            a:1, b:null, c:true, d:null,
            e:"hi", f:null, g:emptyCell(), h:null,
            i:emptyCell().asSlice(), j:null
        };
    }
}