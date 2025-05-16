struct ManyOptional {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
}

contract Test {
    val: ManyOptional;

    init() {
        self.val = ManyOptional{
            a: null, b: null, c: 3, d: null, e: 5,
            f: true, g: null, h: false, i: null, j: true
        };
    }
}