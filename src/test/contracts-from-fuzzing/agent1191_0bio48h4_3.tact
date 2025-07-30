struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract OptionalFields {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null
        };
    }
}