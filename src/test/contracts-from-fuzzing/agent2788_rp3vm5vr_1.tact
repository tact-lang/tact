struct Nested1 { val1: Int; val2: Int?; }

contract TestContract {
    data: Nested1;
    
    init() {
        self.data = Nested1{ val1: 1, val2: null };
    }
}