contract Test() {
    receive() {}
    get fun f(): Bool {
        let fizz: map<Int, Int> = emptyMap();

        return fizz.deepEquals(emptyMap());
    }
}
