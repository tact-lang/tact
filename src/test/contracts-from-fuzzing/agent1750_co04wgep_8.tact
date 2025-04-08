message Msg {
    mval: Int;
}

struct Holder {
    m: Msg?;
    txt: String;
}

contract TestContract {
    data: Holder = Holder{
        m: null,
        txt: "hi",
    };

    init() {}
}