struct DeepSparse {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Wrapper {
    nested: DeepSparse?;
    info: String;
}

contract SparseDeepContract {
    wrapper: Wrapper;

    init() {
        self.wrapper = Wrapper{
            nested: null,
            info: "missing nested"
        };
    }
}