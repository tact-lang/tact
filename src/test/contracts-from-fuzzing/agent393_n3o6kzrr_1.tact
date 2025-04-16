struct Nested {
    inner: StructInner;
}

struct StructInner {
    val1: Int;
    val2: Bool;
    optStr: String?;
}

contract TestStorage {
    data: Nested;

    init() {
        self.data = Nested{
            inner: StructInner{
                val1: 10,
                val2: true,
                optStr: null,
            }
        };
    }
}
