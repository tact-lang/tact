struct InnerMost {
    x: Int;
    y: Bool?;
}

struct Middle {
    im: InnerMost;
    text: String;
}

contract TestContract {
    m: Middle;

    init() {
        self.m = Middle{
            im: InnerMost{
                x: 10,
                y: null
            },
            text: "nested"
        };
    }
}