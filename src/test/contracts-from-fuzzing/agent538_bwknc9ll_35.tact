struct OptStrBool {
    s: String?;
    b: Bool?;
}

struct OuterOpt {
    inner: OptStrBool?;
}

contract OptionalInOptional {
    o: OuterOpt;
    init() {
        self.o = OuterOpt{
            inner : null
        };
    }
}