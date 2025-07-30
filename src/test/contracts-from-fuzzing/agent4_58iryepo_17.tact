struct S {
    data: String;
}

contract Test {
    mapVar: map<Int, S> = emptyMap();

    receive() {
        let s = S { data: "Hello" };
        self.mapVar.set(1, s);
    }
}