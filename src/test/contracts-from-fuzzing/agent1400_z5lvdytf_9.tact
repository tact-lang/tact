struct NullableNested {
    nest: Inner?;
}

struct Inner {
    sub: SubInner?;
}

struct SubInner {
    a: Int;
    b: Bool;
}

contract NullableDeep {
    data: NullableNested;

    init() {
        self.data = NullableNested{
            nest: Inner{
                sub: null
            }
        };
    }
}
