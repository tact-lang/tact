message MyMessage {
    data: Int;
}

contract MultipleBounce {
    bounced(msg: bounced<MyMessage>) {
        // First bounce receiver with typed message
    }

    bounced(rawMsg: Slice) {
        // Second bounce receiver with raw slice
    }
}
