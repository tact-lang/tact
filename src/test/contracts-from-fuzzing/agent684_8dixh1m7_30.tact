struct Complex {
    i: Int;
    b: Bool?;
    s: String;
    addr: Address?;
    c: Cell;
    sl: Slice?;
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool?;
    z: String;
}

contract ComplexFieldsTest {
    val: Complex;
    init() {
        self.val = Complex {
            i:1,
            b:null,
            s:"abc",
            addr:null,
            c:emptyCell(),
            sl:null,
            inner: InnerStruct { x:5, y:null, z:"z" },
        };
    }
}