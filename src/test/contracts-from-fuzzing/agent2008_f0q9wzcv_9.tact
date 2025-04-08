struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: String?;
}

contract ManyOptionalsTest {
    d: ManyOptionals;

    init() {
        self.d = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null
        };
    }
}
