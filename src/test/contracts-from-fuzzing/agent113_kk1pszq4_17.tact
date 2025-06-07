struct SubOpt {
    x: Int?;
}

contract NullableStructWithNullInner {
    so: SubOpt?;

    init() {
        self.so = SubOpt{ x: null };
    }
}