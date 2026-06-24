struct Prims {
    aa: Int;
    bb: Bool;
}

contract StructPersistent {
    s: Prims;
    init() {
        self.s = Prims{ aa:1, bb:false };
    }
    receive() {
        let _ = self.s.bb;
    }
}