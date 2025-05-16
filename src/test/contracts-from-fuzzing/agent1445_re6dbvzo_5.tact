struct S1 {
    intVal: Int;
    strVal: String;
}

struct S2 {
    flag: Bool;
    nested: S1;
}

struct S3 {
    maybeNested: S2?;
    extra: Int;
}

contract ChainOptional {
    data: S3;

    init() {
        self.data = S3{
            maybeNested: S2{
                flag: true,
                nested: S1{
                    intVal: 777,
                    strVal: "hello",
                },
            },
            extra: 999,
        };
    }
}