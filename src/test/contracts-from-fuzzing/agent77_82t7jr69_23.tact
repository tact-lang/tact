message(55) InnerMsg {
    foo: Int;
}

struct Holder {
    optMsg: InnerMsg?;
}

contract TestContract {
    val: Holder = Holder{optMsg: null};
    init() {}
}