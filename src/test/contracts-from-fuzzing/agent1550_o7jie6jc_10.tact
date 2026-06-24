struct OptionalInOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract OptionalInOptionalContract {
    o: OptionalInOptional;
    init() {
        self.o = OptionalInOptional{
            inner: InnerOpt{
                val: null
            }
        };
    }
}