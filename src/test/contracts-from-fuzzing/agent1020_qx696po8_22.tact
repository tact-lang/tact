struct InnerMost {
    a: Int; b: Bool; c: String;
}

struct MiddleMost {
    x: InnerMost; y: InnerMost; z: InnerMost;
}

struct OuterMost {
    left: MiddleMost;
    right: MiddleMost;
}

contract LargeDeepTest {
    storage: OuterMost;

    init() {
        self.storage = OuterMost{
            left: MiddleMost{
                x: InnerMost{a:1,b:true,c:"a"},
                y: InnerMost{a:2,b:false,c:"b"},
                z: InnerMost{a:3,b:true,c:"c"}
            },
            right: MiddleMost{
                x: InnerMost{a:4,b:true,c:"d"},
                y: InnerMost{a:5,b:false,c:"e"},
                z: InnerMost{a:6,b:true,c:"f"}
            }
        };
    }
}