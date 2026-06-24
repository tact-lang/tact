struct Leaf { a: Int as uint8; b: Bool; c: String; }

struct Mid {
    leaf1: Leaf; 
    leaf2: Leaf; 
}

contract ManyNested {
    one: Mid;
    two: Mid;

    init() {
        self.one = Mid{
            leaf1: Leaf{ a:1, b:true, c:"a" },
            leaf2: Leaf{ a:2, b:false, c:"b" }
        };
        self.two = Mid{
            leaf1: Leaf{ a:3, b:true, c:"c" },
            leaf2: Leaf{ a:4, b:false, c:"d" }
        };
    }
}