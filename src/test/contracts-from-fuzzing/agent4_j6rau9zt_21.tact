message MapValueStruct {
    nested: MapHolder
}

struct MapHolder {
    m: map<Int, Int>
}

contract Test {
    receive() {
        // do nothing
    }
}