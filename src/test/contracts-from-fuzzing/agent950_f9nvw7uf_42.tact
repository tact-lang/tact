// optional struct nested optionals with default values
struct DOpt {
    foo: Int? = null;
    bar: Bool? = null;
}

contract DefaultNestedOpt {
    val: DOpt?;

    init() {
        self.val = null;
    }
}