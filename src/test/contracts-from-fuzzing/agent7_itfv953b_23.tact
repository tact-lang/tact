struct Deep {
    a: Int;
    b: String?;
}

contract DeepInit {
    s: Deep;

    init() {
        self.s = Deep{
            a: 123,
            b: null
        };
    }
}