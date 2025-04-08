struct Sub {
    num: Int = 5;
    text: String = "init";
}

struct Wrapper {
    a: Int = 1;
    s: Sub;
}

contract NestedMix {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            a: 3,
            s: Sub{num:9, text: "nine"}
        };
    }
}