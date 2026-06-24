struct HasManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract OptionPacked {
    options: HasManyOptionals;
    init() {
        self.options = HasManyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}