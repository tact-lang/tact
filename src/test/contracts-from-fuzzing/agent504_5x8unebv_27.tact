struct ManyPrims {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
}

contract PrimMix {
    data: ManyPrims;

    init() {
        self.data = ManyPrims{
            a:5,b:true,c:myAddress(),d:"abc",e:emptyCell()
        };
    }

    receive() {
        let _ = self.data;
    }
}