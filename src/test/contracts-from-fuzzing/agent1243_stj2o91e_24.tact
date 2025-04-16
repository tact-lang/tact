struct OptPrim {
    i: Int?;
    b: Bool?;
    a: Address?;
    s: String?;
    c: Cell?;
    sl: Slice?;
}

contract TestContract {
    x: OptPrim;

    init() {
        self.x = OptPrim{ i:null, b:null, a:null, s:null, c:null, sl:null };
    }

    receive() {
        dump(0);
    }
}