message Inner {
    value: Int;
}

message Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    init() {
        send(SendParameters{
            to: myAddress(),
            value: 0,
            mode: 64,
            body: Outer{inner: Inner{value: 1}, flag: true}.toCell()
        });
    }
    receive() {

    }
}