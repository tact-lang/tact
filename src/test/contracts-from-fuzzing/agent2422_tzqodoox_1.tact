struct Nested {
    val: Int;
    flag: Bool;
}

contract TestContract {
    nested: Nested;
    
    init() {
        self.nested = Nested{ val: 1, flag: true };
    }
}