struct S1 {
    flag: Bool;
}

struct S2 {
    val: Int;
    nested: S1;
}

struct S3 {
    text: String;
    nested: S2;
}

contract ChainedNested {
    deep: S3;
    init() {
        self.deep = S3{
            text: "deep", nested: S2{ val: 5, nested: S1{ flag: true } }
        };
    }
}