contract Test {
    receive() {
        let fizz: map<Int, Int> = emptyMap();
        fizz.set(1, 42);
        let res: Int? = fizz.get(1);
        if (res != null) {
            dump(res);
        }
    }
}
