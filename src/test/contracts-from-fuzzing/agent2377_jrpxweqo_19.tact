struct DeepStringNest3 {
    s3: String;
}
struct DeepStringNest2 {
    s2: String;
    n3: DeepStringNest3;
}
struct DeepStringNest1 {
    s1: String;
    n2: DeepStringNest2;
}

contract DeepNestedStringStruct {
    val: DeepStringNest1;

    init() {
        self.val = DeepStringNest1{
            s1: "1",
            n2: DeepStringNest2{
                s2: "2",
                n3: DeepStringNest3{
                    s3: "3",
                },
            },
        };
    }
}