struct Deep {
    a: Int as int4;
    b: Int? as uint4;
}

contract SerializeOptionalNested {
    d: Deep?;

    init() {
        self.d = null;
    }
}