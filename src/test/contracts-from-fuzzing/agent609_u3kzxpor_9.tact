struct InnerMost {
    value: Int?;
    flag: Bool;
}

struct MidLevel {
    inner: InnerMost?;
}

contract OptDeep {
    data: MidLevel?;

    init() {
        self.data = MidLevel{ inner: InnerMost{ value: null, flag: true } };
    }
}