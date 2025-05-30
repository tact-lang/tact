struct Container {
    inner: Int?;
}

contract OptInsideStruct {
    saved: Container;

    init() {
        self.saved = Container{ inner: null };
    }
}