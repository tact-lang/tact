struct Mix {
    a: Int as uint3;
    b: Int as int5;
    c: Int = 42;
    d: String;
    e: String?;
    f: Bool;
    g: Bool?;
    h: Int as uint8;
    i: Int; 
}

contract MaxMix {
    val: Mix;
    init() {
        self.val = Mix{
            a: 3, b: -5, c: 99, d: "", e: null, f: true, g: null, h: 200, i: 12345
        };
    }
}