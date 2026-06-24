struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract ManyOptionalsTest {
    m: ManyOptionals;

    init() {
        self.m = ManyOptionals{
            a: null, b: null, c: null, d: null
        };
    }
}
