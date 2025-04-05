struct Inner {
    value: Int;
}

message StructField {
    inner: Inner;
}

contract TestContract {
    receive(msg: StructField) {
    }
}