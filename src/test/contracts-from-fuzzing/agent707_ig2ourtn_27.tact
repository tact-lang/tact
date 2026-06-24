struct Wrapped {
    val: Int;
}

contract FieldWithDefaultWrap {
    x: Wrapped = Wrapped{val:10};
    y: Wrapped = Wrapped{val:20};

    init() {
        self.x = Wrapped{val:100};
        self.y = Wrapped{val:200};
    }
}