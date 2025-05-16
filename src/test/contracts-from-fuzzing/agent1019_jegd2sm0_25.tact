message Msg1 {
    x: Int;
}

struct Holder {
    m: Msg1;
}

contract TestContract {
    h: Holder;

    init() {
        self.h = Holder{m: Msg1{x: 1}};
    }
}