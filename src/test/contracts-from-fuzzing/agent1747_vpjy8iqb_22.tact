struct Info {
    n: Int;
    flag: Bool;
}

struct Wrapper {
    info: Info?;
    text: String;
}

contract OptionalNestedField {
    val: Wrapper;

    init() {
        self.val = Wrapper{ info: null, text: "abc" };
    }
}