struct NullNested {
    s: InnerNull?;
}

struct InnerNull {
    val: Int?;
}

contract NullDeep {
    data: NullNested;

    init() {
        self.data = NullNested{
            s: InnerNull{
                val: null
            }
        };
    }
}