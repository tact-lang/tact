struct Nested {
    n1: Int;
    n2: Bool;
    n3: Address;
}

contract StructFieldTest {
    nested: Nested;
    
    init() {
        self.nested = Nested{
            n1: 42,
            n2: true,
            n3: myAddress()
        };
    }
}