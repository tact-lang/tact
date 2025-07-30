struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
}

contract ManyOptionalsTest {
    opt: ManyOptionals;
    init() {
        self.opt = ManyOptionals{ a:null,b:null,c:null,d:null,e:null };
    }
}
