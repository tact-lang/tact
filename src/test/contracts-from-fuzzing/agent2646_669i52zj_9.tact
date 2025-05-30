struct Opt1 {
    v1: Int?;
}

struct Opt2 {
    s1: Opt1?;
}

contract OptionalInOptional {
    s: Opt2;
    init() {
        self.s = Opt2{
            s1: Opt1{v1: null}
        };
    }
    receive() {}
}