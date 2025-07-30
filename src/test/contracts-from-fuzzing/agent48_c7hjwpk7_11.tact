struct Two { first: Int; second: Int; }

contract Test {
    fun discard(s: Two) {
        let Two { second: _, first } = s;
        dump(first);
    }

    receive() {
        self.discard(Two { first: 100, second: 50 });
    }
}
