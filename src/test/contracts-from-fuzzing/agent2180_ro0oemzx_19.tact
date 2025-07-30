struct Sub {
    x: Int;
    y: Int;
}

struct Holder {
    opt: Sub?;
}

contract OptionalSub {
    state: Holder;

    init() {
        self.state = Holder{
            opt: null
        };
    }
}