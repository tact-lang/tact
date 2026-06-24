struct Struct1 {
    x: Int;
}

struct Struct2 {
    y: Struct1;
}

struct Struct3 {
    z: Struct2;
}

contract TestChain {
    value: Struct3;
    init() {
        self.value = Struct3{ z: Struct2{ y: Struct1{ x: 777 } } };
    }
}