struct InnerMost { val: Int; }

struct InnerDeep {
    inner: InnerMost?;
    flag: Bool;
}

struct Wrapper {
    deep: InnerDeep;
}

contract TestContract {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{
            deep: InnerDeep{
                inner: InnerMost{ val: 123 },
                flag: true
            }
        };
    }
}