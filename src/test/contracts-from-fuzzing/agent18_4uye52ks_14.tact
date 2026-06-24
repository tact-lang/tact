struct Inner {
    value: Int;
}

fun getValue(inner: Inner): Int {
    return inner.value;
}

message MyMessage {
    inner: Inner;
}

contract TestContract {
    receive(msg: MyMessage) {
        let val = getValue(msg.inner);
    }
}