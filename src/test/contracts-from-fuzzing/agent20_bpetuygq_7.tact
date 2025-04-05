fun createMap(): map<Int, Int> {
    return emptyMap();
}

contract TestMap {
    receive() {
        let m: map<Int, Int> = createMap();
    }
}
