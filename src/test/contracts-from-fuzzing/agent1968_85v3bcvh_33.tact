struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract Test34 {
    val: ManyOptionals;
    init() {
        self.val = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null
        };
    }
}