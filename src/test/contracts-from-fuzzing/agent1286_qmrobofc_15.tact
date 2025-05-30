struct First {
    a: Int;
    b: Second;
}

struct Second {
    x: Int?;
    y: Bool;
    z: Third;
}

struct Third {
    k: String;
    m: Int;
}

contract DeepChain {
    f: First;

    init() {
        self.f = First{
            a:1, 
            b: Second{ x:null, y: true, z: Third{ k:"done", m:42 } }
        };
    }
}