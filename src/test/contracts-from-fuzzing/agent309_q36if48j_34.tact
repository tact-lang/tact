struct Alpha {
    val: Int;
}

struct Beta {
    val: Int;
    other: Alpha;
}

contract StructInStruct {
    b: Beta;

    init() {
        self.b = Beta{val:5, other:Alpha{val:3}};
    }
}