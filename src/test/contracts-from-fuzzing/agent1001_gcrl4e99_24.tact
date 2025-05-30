struct BaseLevel {
    x: Int as uint8;
    y: String;
}

struct HighLevel {
    a: BaseLevel;
    b: BaseLevel?;
    c: String;
}

contract MixNullable {
    s: HighLevel;
    
    init() {
        self.s = HighLevel{
            a: BaseLevel{ x:1, y:"a" },
            b: null,
            c: "c"
        };
    }
}