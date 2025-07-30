struct WithString {
    s: String;
}

struct Wrapper {
    val: WithString;
}

contract StringInNestedStruct {
    field: Wrapper;

    init() {
        self.field = Wrapper{val: WithString{s: "hello"}};
    }
}
