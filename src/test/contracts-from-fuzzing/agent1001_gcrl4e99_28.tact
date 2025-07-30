// Attempt deeply nested optionals in struct fields

struct InnerOpt {
    val: Int?;
}

struct MidOpt {
    inner: InnerOpt?;
    flag: Bool;
}

contract NestedNullable {
    state: MidOpt;

    init() {
        self.state = MidOpt{
            inner: null,
            flag: true
        };
    }
}