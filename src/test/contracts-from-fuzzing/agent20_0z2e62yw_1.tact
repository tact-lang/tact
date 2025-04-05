
struct Inner {
    a: Int;
}

message Outer {
    inner: Inner?;
}

contract TestContract {
    receive(msg: Outer) {
        if (msg.inner != null) {
            let innerValue = msg.inner!!.a;
        }
    }
}
