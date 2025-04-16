struct Flat {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: String;
    g: String?;
    h: Cell;
    i: Slice;
    j: Address;
    k: Int;
    l: Int;
    m: Bool;
    n: String;
    o: String?;
    p: Cell;
    q: Slice;
    r: Address;
    s: Int;
    t: Bool;
}

contract TestContract {
    data: Flat;

    init() {
        self.data = Flat{
            a:1, b:2, c:3, d:true, e:false, f:"hi", g:"opt", h:emptyCell(), i:emptyCell().asSlice(),
            j:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            k:4, l:5, m:true, n:"x", o:"opt2", p:emptyCell(), q:emptyCell().asSlice(),
            r:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"), s:6, t:false,
        };
    }

    receive() {
        let _ = self.data;
    }
}