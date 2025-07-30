struct Prims {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract TestPrimStruct {
    data: Prims;

    init() {
        self.data = Prims{
            i:null,
            b:null,
            s:null,
            a:null,
            c:null,
            sl:null
        };
    }

    receive() {
        let x = self.data;
    }
}