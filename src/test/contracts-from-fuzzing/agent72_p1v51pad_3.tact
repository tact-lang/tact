struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract TestContract {
    multiOpt: ManyOptionals = ManyOptionals{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null,
    };
    
    receive() {
        let _ = self.multiOpt;
    }
}