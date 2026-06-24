struct Pair {
    first: Int;
    second: Int;
}

message Wrapper {
    pair: Pair;
}

contract Test {
    receive(msg: Wrapper) {
        let s = msg.pair.second;
    }
}