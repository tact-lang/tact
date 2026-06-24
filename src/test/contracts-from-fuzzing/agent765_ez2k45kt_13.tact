struct Left {
    x: Int;
}

struct Right {
    y: Int;
}

struct Top {
    l: Left?;
    r: Right?;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{ l: Left{ x: 1 }, r: Right{ y: 2 } };
    }
}