// Persistent optional struct chain, init middle null
struct Foo {
    num: Int;
}

struct Bar {
    foo: Foo?;
}

contract OptionMidNull {
    bar: Bar?;
    
    init() {
        self.bar = Bar{
            foo: null,
        };
    }
}