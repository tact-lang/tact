struct Foo { x: Int; } 
struct Bar { foo: Foo? }

contract InOpt {
    data: Bar;
    init() {
        self.data = Bar{ foo: null };
    }
}