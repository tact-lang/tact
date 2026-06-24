// Compose two complex structs
struct Alpha {
    a: Int;
    b: Bool?;
    c: String;
}

struct Beta {
    x: Alpha;
    y: Alpha?;
}

contract DuoComplex {
    z: Beta;
    init() {
        self.z = Beta{
            x: Alpha{ a:1, b:null, c:"x" },
            y: null
        };
    }
}