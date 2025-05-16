struct Nested { val1: Int; val2: Int?; val3: Bool; }

contract DeepNestedTest {
    myData: Nested;
    
    init() {
        self.myData = Nested{ val1: 5, val2: null, val3: true };
    }
}