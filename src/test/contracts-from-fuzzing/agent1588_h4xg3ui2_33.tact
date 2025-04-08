struct ManyOptional {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?; f: Int?; g: Int?; h: Int?;
}

contract ManyNulls {
    v: ManyOptional;
    init() {
        self.v = ManyOptional{
            a: null, b: null, c: null, d: null,
            e: null, f: null, g: null, h: null
        };
    }
}