struct OptionalDeep {
    inner_opt: Int?;
    bool_opt: Bool?;
}

struct Wrapper {
    data: OptionalDeep?;
}

contract OptionalNested {
    st: Wrapper;

    init() {
        self.st = Wrapper{
            data: OptionalDeep{
                inner_opt: 33,
                bool_opt: null,
            },
        };
    }
}