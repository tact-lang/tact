struct InnerString {
    s: String;
}

contract StringStructOptional {
    f: InnerString?;

    init() {
        self.f = null;
    }
}