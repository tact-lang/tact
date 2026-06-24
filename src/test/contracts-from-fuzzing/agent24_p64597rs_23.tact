message Outer {
    inner: Inner?;
}

message Inner {
    value: Int;
}

contract Test {
    receive(msg: Outer) {
        let val: Inner? = msg.inner;
        if (val != null) {
            let unwrapped = val!!;
            let d = unwrapped.value;
        }
    }
}