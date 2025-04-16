struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: Slice?;
    f: String?;
}

contract ManyOptionalsTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}