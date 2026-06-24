struct NestedOpt {
    inner: Int?;
}

struct Wrapper {
    nest: NestedOpt?;
    flag: Bool;
}

contract DeepOpt {
    data: Wrapper;
    init() {
        self.data = Wrapper {
            nest: null,
            flag: true
        };
    }
}