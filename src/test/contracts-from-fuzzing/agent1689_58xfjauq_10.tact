struct Complex {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Bool?;
    h: Int?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
    m: Nested1;
    n: Nested2?;
}

struct Nested1 {
    x: Int;
    y: Bool;
}

struct Nested2 {
    q: String;
    r: Bool?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"A",
            g:false, h:7, i:null, j:null, k:null, l:null,
            m: Nested1{ x: 11, y: false },
            n: Nested2{ q: "Q", r: null }
        };
    }
}