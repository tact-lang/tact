// Contract with big nested struct with optional nested struct value
struct SubData {
    val: Int?;
}

struct BigContainer {
    s1: Int;
    s2: Bool;
    s3: String;
    sub: SubData?;
}

contract StructNestedOpt {
    x: BigContainer;

    init() {
        self.x = BigContainer{
            s1: 42,
            s2: true,
            s3: "hi",
            sub: null
        };
    }
}
