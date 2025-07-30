// test struct with long sequence of primitive fields
struct ManyPrims {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String;
    c1: Cell;
    a_addr: Address;
}

contract TestPrimSeq {
    data: ManyPrims;

    init() {
        self.data = ManyPrims{
            a1:1, a2:2, a3:3, a4:4, a5:5,
            b1:true, b2:false, b3:true, b4:false, b5:true,
            s1:"x", s2:"y",
            c1: emptyCell(),
            a_addr: myAddress()
        };
    }
}
