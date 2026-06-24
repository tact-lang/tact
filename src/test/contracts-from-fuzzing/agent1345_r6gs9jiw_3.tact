struct A {
    x: Int;
    y: Int?;
}

struct B {
    a: A;
    optA: A?;
}

contract StorageOptionalTest {
    item: B;
    
    init() {
        self.item = B{
            a: A{ x: 10, y: null },
            optA: null
        };
    }
}