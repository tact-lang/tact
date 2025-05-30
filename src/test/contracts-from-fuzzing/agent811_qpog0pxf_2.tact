contract TestContract {
    foo: Int = 0;
    bar: Bool = true;
    baz: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    data: Cell = cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    sliceVal: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    str: String = "test";

    init() {
        self.foo = 1;
        self.bar = false;
        self.baz = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.data = cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
        self.sliceVal = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
        self.str = "hello";
    }
}