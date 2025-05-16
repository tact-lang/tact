struct RecursionX {
    y: RecursionY;
}

struct RecursionY {
    z: Int;
}

contract RecursionAllowed {
    r: RecursionX;
    
    init() {
        self.r = RecursionX{
            y: RecursionY{ z: 123 },
        };
    }
}