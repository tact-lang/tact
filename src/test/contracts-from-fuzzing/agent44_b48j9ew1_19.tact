struct Left {
    nums: Int;
}

struct Right {
    flag: Bool;
}

contract TwoStructs {
    l: Left;
    r: Right;

    init() {
        self.l = Left{ nums: 3 };
        self.r = Right{ flag: false };
    }

    receive() {
        self.r.flag = true;
    }
}