struct Nested {
    inner1: Int;
    inner2: Bool?;
    inner3: String;
}

contract Test {
    first: Nested; 
    second: Nested;
    third: Int;
    
    init() {
        self.first = Nested{ inner1: 1, inner2: true, inner3: "a" };
        self.second = Nested{ inner1: 2, inner2: false, inner3: "b" };
        self.third = 3;
    }
}