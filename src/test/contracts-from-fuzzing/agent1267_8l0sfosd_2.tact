struct Nested2 {
    n1: Int;
    n2: Bool?;
    n3: String;
}

struct Nested1 {
    s1: Int?;
    s2: String?;
    s3: Nested2?;
}

contract ManyLayers {
    f1: Nested1?;
    f2: Int;
    
    init() {
        self.f1 = null;
        self.f2 = 0;
    }
}

contract Referencer {
    receive() {
        let dummy: ManyLayers? = null;
    }
}