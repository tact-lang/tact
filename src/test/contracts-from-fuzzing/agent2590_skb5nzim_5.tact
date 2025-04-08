struct HasManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract ManyOptionalsContract {
    foo: HasManyOptionals;

    init() {
        self.foo = HasManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}