contract MultiFieldTest {
    intField: Int = 0;
    boolField: Bool = false;
    addrField: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    strField: String = "hello";
    cellField: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
    sliceField: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    init() {
        self.intField = 100;
        self.boolField = true;
        self.strField = "world";
        self.cellField = cell("te6cckEBAQEAAgAAAEysuc0=");
        self.sliceField = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    }
}