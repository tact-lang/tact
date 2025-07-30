struct MapValueMessage {
    nested: MapHolder
}

message MapHolder {
    m: map<Int, Int>
}

contract Test {
    receive() {
        // do nothing
    }
}