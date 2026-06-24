struct DeepNested {
    f1: Int?;
    f2: Bool?;
    f3: SubNested;
}

struct SubNested {
    sub1: Int?;
    sub2: Bool;
}

contract TestDeepOptional {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            f1: null,
            f2: true,
            f3: SubNested{sub1: null, sub2: false},
        };
    }

    receive() {
        let _ = self.data.f3.sub1;
    }
}