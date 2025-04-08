message(1) Leaf { num: Int }

struct Mid {
    leaf: Leaf;
}

message(2) Wrapper {
    mid: Mid;
    flag: Bool;
}

contract Nest {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            mid: Mid{ leaf: Leaf{ num:42 } },
            flag: true
        };
    }

    receive() {}
}