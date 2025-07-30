message MapMsg {
    entries: map<Int, Int>;
}

contract Test {
    receive(msg: MapMsg) {
        let m = msg.entries;
    }
}