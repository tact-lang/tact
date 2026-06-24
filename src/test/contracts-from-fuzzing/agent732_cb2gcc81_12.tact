struct A {
    num: Int;
}

struct B {
    extra: Int?;
    a: A?;
}

contract CombinedOptionals {
    b: B;
    
    init() {
        self.b = B{
            extra: 99,
            a: null
        };
    }
}