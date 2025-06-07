const TON_POINT_ONE: Int = ton("0.1"); // expected: 100000000

contract TestTon() {
    receive() {
        require(TON_POINT_ONE == 100000000, "ton(\"0.1\") did not evaluate to 100000000");
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: "ton OK".asComment(),
        });
    }
}
