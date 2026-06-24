struct DeeplyNested {
    innermost: String;
}

struct MidNested {
    mid: DeeplyNested;
    optionalInner: DeeplyNested?;
}

struct Outer {
    id: Int;
    nested: MidNested;
}

contract TestStorage {
    data: Outer;

    init() {
        self.data = Outer{
            id: 1,
            nested: MidNested{
                mid: DeeplyNested{ innermost: "hello" },
                optionalInner: null,
            },
        };
    }

    receive() {
        let _ = self.data;
    }
}