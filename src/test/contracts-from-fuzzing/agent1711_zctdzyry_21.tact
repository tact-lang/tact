struct StructWithInt {
    v: Int;
}

contract OptionalStructDefault {
    data: StructWithInt? = null;

    init() {
        self.data = null;
    }
}