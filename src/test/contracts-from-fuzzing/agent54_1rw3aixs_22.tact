message Msg {
    s: MyStruct;
}

struct MyStruct {
    v: Int;
}

contract Test {
    receive(msg: Msg) {
        let x = msg.s.v;
    }
}