contract Test {
    mapVar: map<Int, Bool> = emptyMap();

    receive() {
        self.mapVar.set(1, true);
    }
}