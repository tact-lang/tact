struct S1 {
    i: Int;
}

struct S2 {
    inner: S1;
}

struct S3 {
    x: S2;
    y: Bool;
    z: Int?;
}

contract ContractNested {
    store: S3;
    init() {
        self.store = S3{
            x: S2{inner: S1{i:42}},
            y: true,
            z: null,
        };
    }
}
