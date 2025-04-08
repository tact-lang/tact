struct SubOpt {
    val: Int;
}

struct Holder {
    s: SubOpt?;
}

contract Test5 {
    holder: Holder;

    init() {
        self.holder = Holder{
            s: null,
        };
    }

    receive() {}
}