struct StructOptOptionals {
    ia: Int?;
    sa: String?;
    ba: Bool?;
}

struct Wrap {
    s: StructOptOptionals?;
}

contract OptionalStructField {
    data: Wrap;

    init() {
        self.data = Wrap{
            s: null
        };
    }
}