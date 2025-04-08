struct Middle {
    a: Int;
    b: Bottom?;
}

struct Bottom {
    x: Int;
    y: Int;
}

contract OptionalStructField {
    data: Middle;

    init() {
        self.data = Middle{
            a: 1,
            b: null
        };
    }
}
