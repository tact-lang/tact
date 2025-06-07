struct InnerLayer {
    innerVal: Int = 7;
    innerFlag: Bool = true;
}

struct Container {
    nested: InnerLayer;  // Nested struct
    flag: Bool = false;
    amount: Int?;        // Optional field
    name: String = "abc";
}

contract StorageTest {
    data: Container;  // Composite struct as persistent variable
    
    init() {
        self.data = Container{
            nested: InnerLayer{ innerVal: 42, innerFlag: false },
            flag: true,
            amount: 123,
            name: "hello"
        };
    }
}