struct WithString {
    s: String;
    optS: String?;
}

contract StringStruct {
    data: WithString;

    init() {
        self.data = WithString{
            s: "test",
            optS: null
        };
    }
}