struct SOptNested {
    s1: Int?;
    s2: Int;
    s3: Int?;
}

struct Wrap {
    inner: SOptNested?;
}

contract Test10 {
    data: Wrap;
    init() {
        self.data = Wrap{inner:null};
    }
}