struct A { 
    aa: Int;
}
struct B {
    bb: Int;
    nested: A;
}

contract NestedDefaults {
    data: B = B{bb:5,nested:A{aa:1}};

    init() {
        self.data = B{bb:6,nested:A{aa:2}};
    }
}
