struct DeeplyNested {
    a: Int;
    b: Inner1;
}

struct Inner1 {
    c: Inner2;
    d: Bool;
}

struct Inner2 {
    e: String;
    f: Bool?;
}

contract NestedDeep {
    val: DeeplyNested;

    init() {
        self.val = DeeplyNested{
            a: 5,
            b: Inner1{
                c: Inner2{
                    e: "deep",
                    f: null,
                },
                d: true,
            },
        };
    }
}