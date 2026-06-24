struct A {
    val: Int = 5;
}

struct B {
    nested: A? = null;
    flag: Bool = false;
}

contract NestOptDefault {
    b: B;
    
    init() {
        self.b = B{};
    }
}