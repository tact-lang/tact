struct OptInt {
    x: Int?;
}
struct OptBool {
    y: Bool?;
}
struct OptString {
    z: String?;
}

struct Grouped {
    a: OptInt;
    b: OptBool;
    c: OptString;
}

contract GroupedOptionals {
    g: Grouped;
    init() {
        self.g = Grouped{
            a: OptInt{x:null},
            b: OptBool{y:null},
            c: OptString{z:null}
        };
    }
}