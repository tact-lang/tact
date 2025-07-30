contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {}

    // Getter returning a map
    get fun getMap(): map<Int, Int> {
         return self.m;
    }
}
