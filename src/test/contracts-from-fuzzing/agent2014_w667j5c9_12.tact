struct PrimAllOpt {
    i: Int;
    b: Bool;
    a: Address?;
    c: Cell;
    s: String;
}

contract PrimFullOpt {
    data: PrimAllOpt;

    init() {
        self.data = PrimAllOpt{
            i:1,
            b:true,
            a:null,
            c:emptyCell(),
            s:"test"
        };
    }
}