struct LeafOpt {
    flag: Bool?;
    text: String?;
}

struct Wrapper {
    inner: LeafOpt?;
}

contract OptionalNested {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: LeafOpt{
                flag: null,
                text: null
            }
        };
    }
}
