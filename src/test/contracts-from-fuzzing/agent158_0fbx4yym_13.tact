message MyMessage {
    a: Int;
}

contract Test {
    bounced(msg: bounced<MyMessage>) {
        // bounced message receiver processing bounced typed message
    }
}
