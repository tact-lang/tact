struct Middle {
    x: Int;
    y: String?;
}

struct Top {
    a: Middle;
    b: Middle;
}

contract Record {
    data: Top;

    init() {
        self.data = Top{
            a: Middle{ x:5, y:"hi" },
            b: Middle{ x:6, y:null }
        };
    }
}
