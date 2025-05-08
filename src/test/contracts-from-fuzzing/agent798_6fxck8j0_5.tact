struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    wrapped: InnerOpt;
}

contract OptionalNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            wrapped: InnerOpt{
                val: null,
            }
        };
    }
}