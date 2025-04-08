struct Inner { i: Int; b: Bool }
struct Outer {
    a: Int as uint8;
    flag: Bool;
    nest: Inner;
    optInner: Inner?;
    msg: MessageOne;
}

message(0x42) MessageOne {
    mdata: Int;
}

contract TestContract {
    st: Outer = Outer {
        a: 11,
        flag: true,
        nest: Inner { i: 33, b: false },
        optInner: null,
        msg: MessageOne { mdata: 100 }
    };

    receive() {}
}