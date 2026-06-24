struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }
struct Container {
    s1: S1?;
    s2: S2?;
    s3: S3?;
}

contract OptionContainer {
    data: Container;

    init() {
        self.data = Container{
            s1: null,
            s2: null,
            s3: null
        };
    }
}
