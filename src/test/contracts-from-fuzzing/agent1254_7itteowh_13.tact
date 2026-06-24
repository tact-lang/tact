struct BigNested {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

struct Wrapper {
    field1: Int;
    nested: BigNested;
}

contract WideNestedStructs {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            field1: 1,
            nested: BigNested{
                s1: "1",
                s2: "2",
                s3: "3",
                s4: "4",
                s5: "5",
            }
        };
    }
}