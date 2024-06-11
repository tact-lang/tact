primitive Int;
primitive Bool;

trait BaseTrait {
    
}

struct A {
    a: Int;
    b: Int;
}

contract Contract {
    value: Int;
    value2: A;
    init(arg: Bool) {
        self.value = self.value2.a + 1;
        self.value2 = A{ a: 1, b: 2 };
    }
}