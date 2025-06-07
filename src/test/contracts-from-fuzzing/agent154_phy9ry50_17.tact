message ExtMsg {
    flag: Bool;
}

contract Test {
    // External receiver with a non-allowed message type (ExtMsg) parameter
    external(msg: ExtMsg) {
        acceptMessage();
    }
}
