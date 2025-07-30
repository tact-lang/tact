struct X {
    val: Int? as uint64;
    label: String?;
}

contract Test {
    data: X;

    init() {
        self.data = X{
            val: null,
            label: null
        };
    }
}
