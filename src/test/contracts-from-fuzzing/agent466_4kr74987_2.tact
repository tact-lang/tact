struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    nested: Inner; 
    extra: Int;
}

contract DeepOptionalTest {
    state: Outer;

    init() {
        self.state = Outer{
            nested: Inner{foo: null, bar: null},
            extra: 123
        };
    }
}