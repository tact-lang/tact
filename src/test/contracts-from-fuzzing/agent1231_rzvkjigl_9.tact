struct OptionDeep {
    nested: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: OptionDeep;
    
    init() {
        self.data = OptionDeep{
            nested: Inner{foo: 7, bar: false}
        };
    }
}
