contract Test1 {
    get fun f() : Int {
        let foo: map<Int, Int> = emptyMap();
        foo.set(42, 100);
        return foo.get(42)!!;
    }
}
