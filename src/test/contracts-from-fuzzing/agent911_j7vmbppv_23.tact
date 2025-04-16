struct DeepNestA { 
    x: Int; 
    y: DeepNestB;
}

struct DeepNestB {
    p: DeepNestC;
}

struct DeepNestC {
    s: String;
}

contract ManyDeepStructs {
    val: DeepNestA;

    init() {
        self.val = DeepNestA{
            x:123,
            y: DeepNestB{
                p: DeepNestC{
                    s: "abc"
                }
            }
        };
    }
}