contract OnlyDefaults {
    foo: Int = 5;
    bar: Bool = true;
    baz: String = "ok";

    receive(){
        self.foo += 1;
    }
}