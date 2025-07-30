struct Inner {
    X: Int;
}

message OptMsg {
    InnerVal: Inner?;
}

contract TestOptFixed {
    receive(msg: OptMsg) {
        if (msg.InnerVal != null) {
            let innerVal: Inner = msg.InnerVal!!;
            let y = innerVal.X;
        }
    }
}
