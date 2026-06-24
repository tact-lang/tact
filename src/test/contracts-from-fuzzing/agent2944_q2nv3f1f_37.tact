struct Wrap {
    f: Int;
}

contract TopOptStruct {
    wrap: Wrap?;

    init() {
        self.wrap = Wrap{f:7};
    }
}