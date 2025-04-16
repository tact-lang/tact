contract Sender {
    fun send(to: Address) {
        send(SendParameters{
            to: to,
            value: 1,
            mode: 1,
            body: beginCell().storeSlice("Hello".asSlice()).endCell()
        });
    }

    receive() {

    }
}

contract Receiver {
    receive() {

    }
}