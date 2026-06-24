contract MultipleStructTypes {
    s1: StructA;
    s2: StructB;
    init() {
        self.s1 = StructA{a:1,b:true};
        self.s2 = StructB{x:"hey",y:false};
    }
}

struct StructA { a: Int; b: Bool; }
struct StructB { x: String; y: Bool; }