struct Combo {
    a: Int as uint32;
    b: Bool;
    c: Int? as uint64;
    d: Bool?;
}

contract TestContract {
    val: Combo;
    init() {
        self.val = Combo{
            a:1, b:true,
            c:null, d:null
        };
    }
}