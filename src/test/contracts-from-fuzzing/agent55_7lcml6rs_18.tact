message ReservedTest {
    bounced: Int;
}

contract TestContract {
    receive(msg: ReservedTest) {
        let r = msg.bounced;
    }
}