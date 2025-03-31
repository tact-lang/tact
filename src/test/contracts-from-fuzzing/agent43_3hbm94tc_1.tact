message Ping {
    value: Int;
}

contract BounceTester {
    bounced(msg: bounced<Ping>) {
        // handling bounced message
    }
}
