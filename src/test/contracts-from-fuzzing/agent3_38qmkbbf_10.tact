struct L3 {
    val: Int;
}

struct L2 {
    l3: L3;
}

message MsgNested {
    l2: L2;
}

contract TestMsgReceiver {
    receive(msg: MsgNested) {
        dump(msg.l2.l3.val);
    }
}
