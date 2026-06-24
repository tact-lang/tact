struct InnerOptBool {
    b: Bool?;
}

contract ContOptBool {
    data: InnerOptBool;

    init() {
        self.data = InnerOptBool{
            b: null
        };
    }
}