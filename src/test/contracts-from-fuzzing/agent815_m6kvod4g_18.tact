struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract ManyOptionalsTest {
    foo: MultipleOptionals;
    
    init() {
        self.foo = MultipleOptionals{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}