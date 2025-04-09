struct A {
    field1: Int;
    field2: Bool;
}

struct B {
    x: A;
    y: Int;
}

contract Test {
    val: B;
    init() {
        self.val = B{ x: A{field1:1,field2:false}, y: 42 };
    }
}