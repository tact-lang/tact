struct A {
    x: Int?;
}

struct B {
    a: A?;
}

struct C {
    b: B?;
}

contract ChainOptional {
    data: C = C{ b: null };
    init() {
        self.data = C{
            b: B{
                a: A{ x: 10 }
            }
        };
    }
}