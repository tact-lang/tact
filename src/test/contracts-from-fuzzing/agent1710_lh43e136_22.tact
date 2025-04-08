struct StructInOpt {
    sub: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalStruct {
    data: StructInOpt;

    init() {
        self.data = StructInOpt{ sub: Inner{ val: 9 } };
    }
}