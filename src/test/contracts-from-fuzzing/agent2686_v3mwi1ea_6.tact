struct NestedString {
    info: String;
    detail: String;
}

struct ManyOptional {
    flag: Bool?;
    count: Int?;
    nested: NestedString?;
}

contract ManyOptionals {
    state: ManyOptional;

    init() {
        self.state = ManyOptional{
            flag: null,
            count: 123,
            nested: NestedString{
                info: "test",
                detail: "detail"
            }
        };
    }
}
