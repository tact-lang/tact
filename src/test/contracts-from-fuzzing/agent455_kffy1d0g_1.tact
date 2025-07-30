struct DeepInner {
    a: Int;
    b: Int?;
}

struct MidLevel {
    ci: DeepInner; 
    dj: Int?;
}

contract DeepNested {
    rec: MidLevel;

    init() {
        self.rec = MidLevel{
            ci: DeepInner{
                a: 1,
                b: null,
            },
            dj: null,
        };
    }
}