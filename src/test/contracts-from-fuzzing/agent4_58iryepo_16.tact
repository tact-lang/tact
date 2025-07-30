struct S {
    value: Int;
}

contract Test {
    mapVar: map<Int, S> = emptyMap();

    receive() {
        let s = S { value: 123 };
        self.mapVar.set(1, s);
    }
}
