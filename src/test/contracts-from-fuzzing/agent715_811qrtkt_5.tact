struct SubField {
    id: Int;
    label: String;
}

struct Wrapper {
    sub: SubField?;
    note: String;
}

contract OptionalNested {
    value: Wrapper;

    init() {
        self.value = Wrapper{
            sub: null,
            note: "hello"
        };
    }
}