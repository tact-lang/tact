struct VeryNested {
    inner1: Int;
    inner2: Bool?;
}

struct Wrapper {
    wrapped: VeryNested;
}

contract TestOptNested {
    optNested: Wrapper?;

    init() {
        self.optNested = Wrapper{
            wrapped: VeryNested{
                inner1:99,
                inner2: null
            }
        };
    }
}