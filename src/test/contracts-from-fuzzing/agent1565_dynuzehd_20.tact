struct DeepStruct {
    a: Int;
    b: Nested1;
}

struct Nested1 {
    c: Nested2;
    d: Int;
}

struct Nested2 {
    e: String;
    f: Nested3;
}

struct Nested3 {
    g: Int;
}

contract DeeplyNestedFields {
    val: DeepStruct;

    init() {
        self.val = DeepStruct{
            a: 1,
            b: Nested1{
                c: Nested2{
                    e: "hi",
                    f: Nested3{
                        g: 99
                    }
                },
                d: 2
            }
        };
    }
}