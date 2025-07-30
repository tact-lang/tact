struct SDeep {
    v1: Int; v2: Int?; v3: Bool; v4: String;
}

struct SContain {
    deep: SDeep;
    another: Int;
}

contract LargeStructInPersistent {
    record: SContain;

    init() {
        self.record = SContain{
            deep: SDeep{v1:1, v2:null, v3:true, v4:"x"},
            another:5
        };
    }
}