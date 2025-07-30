struct OptionalDeep {
    inner: Int?;
    flag: Bool?;
}

struct Wrapper {
    nested: OptionalDeep?;
}

contract Test {
    box: Wrapper;

    init() {
        self.box = Wrapper{
            nested: null
        };
    }
}