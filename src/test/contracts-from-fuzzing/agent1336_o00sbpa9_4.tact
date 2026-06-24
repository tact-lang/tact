struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptionalFieldsTest {
    var1: ManyOptionals;
    
    init() {
        self.var1 = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
    
    receive() {
        let _ = self.var1;
    }
}