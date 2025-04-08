struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptStructTest {
    field: ManyOptionals;

    init() {
        self.field = ManyOptionals{ a:null, b:true, c:null, d:null };
    }
}