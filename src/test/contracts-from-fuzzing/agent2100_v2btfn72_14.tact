struct InnerLevel {
    x: Int;
    y: Bool;
}

struct MidLevel {
    a: Int;
    b: InnerLevel;
}

contract Test {
    f1: MidLevel;
    f2: MidLevel;
    
    init() {
        self.f1 = MidLevel{a:1, b: InnerLevel{x:10, y:true}};
        self.f2 = MidLevel{a:2, b: InnerLevel{x:20, y:false}};
    }
}