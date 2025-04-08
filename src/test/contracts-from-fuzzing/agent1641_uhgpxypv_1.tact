struct Nested {
    n1: Int;
    n2: Bool;
}

contract TestContract {
    s1: Nested;
    
    init() {
        self.s1 = Nested{ n1: 1, n2: true };
    }
}