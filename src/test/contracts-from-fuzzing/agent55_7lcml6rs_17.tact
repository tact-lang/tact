struct ReservedTest {
    bounced: Int;
}

contract TestContract {
    receive() {
        let r = ReservedTest{bounced: 1};
    }
}