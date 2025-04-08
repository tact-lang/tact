struct Nested {
    val1: Int;
    val2: Int?;
}

contract TestContract {
    data: Nested; // nested struct as field
    
    init() {
        self.data = Nested{ val1: 1, val2: 2 };
    }
}