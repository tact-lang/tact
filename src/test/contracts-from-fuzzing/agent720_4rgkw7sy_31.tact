struct Left {
    l: Int;
}

struct Right {
    r: Int;
}

contract MultiBranch {
    leftData: Left;
    rightData: Right;

    init() {
        self.leftData = Left{ l: 77 };
        self.rightData = Right{ r: 88 };
    }
}