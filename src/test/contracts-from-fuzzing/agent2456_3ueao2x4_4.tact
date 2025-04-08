struct Child {
    num: Int;
    txt: String;
}

struct Parent {
    child: Child;
}

contract OptionalStructField {
    maybeData: Parent?;

    init() {
        self.maybeData = null;
    }
}