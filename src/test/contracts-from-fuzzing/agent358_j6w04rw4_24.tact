struct StructA {
    ai: Int; 
    ab: Bool; 
}
struct StructB {
    bi: Int;
    bb: Bool;
}

struct StructC {
    ca: StructA; 
    cb: StructB;
    optS: String?;
}

contract ManyCompose {
    data: StructC;
    init() {
        self.data = StructC{
            ca: StructA{ ai: 1, ab: true },
            cb: StructB{ bi: 2, bb: false },
            optS: null
        };
    }
}