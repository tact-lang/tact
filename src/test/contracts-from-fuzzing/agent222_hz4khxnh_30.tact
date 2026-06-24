struct ContS1 {
    x: Int = 1;
}

struct ContS2 {
    y: String = "y";
}

struct Wrap {
    s1: ContS1?;
    s2: ContS2?;
}

contract OptStructs {
    val: Wrap = Wrap{s1: null, s2: null};

    receive() {
        self.val = Wrap{s1: ContS1{x: 7}, s2: ContS2{y: "x"}};
    }
}