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
        self.value2 = A{ a: 1, b: self.value };
        self.value = self.value2.a + 1;
    }
}