contract Dummy {
    receive() {}
}

fun testSendAddress() : Bool {
    let dummy: Address = myAddress();
    send(SendParameters{
       to: dummy,
       value: 0,
       mode: 0,
       body: beginCell().endCell()
    });
    return true;
}

fun main() {
    let res = testSendAddress();
}
