struct ManyOptionalStructs {
    s1: Inner?;
    s2: Inner?;
    s3: Inner?;
    s4: Inner?;
    s5: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
    s: String;
}

contract MultipleOptionalStructsTest {
    data: ManyOptionalStructs;

    init() {
        self.data = ManyOptionalStructs {
            s1: null,
            s2: null,
            s3: null,
            s4: null,
            s5: null
        };
    }
}