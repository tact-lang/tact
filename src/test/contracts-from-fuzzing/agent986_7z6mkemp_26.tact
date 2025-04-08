struct OptionalString {
    s: String?;
}

struct OptionalBool {
    b: Bool?;
}

contract MixNullable {
    s1: OptionalString;
    s2: OptionalBool;
    
    init() {
        self.s1 = OptionalString{s:null};
        self.s2 = OptionalBool{b:null};
    }
}
