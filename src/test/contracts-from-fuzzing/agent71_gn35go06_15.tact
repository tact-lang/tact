struct StringOptionals {
    s: String?;
    t: String?;
}

contract TestContract {
    data: StringOptionals;

    init() {
        self.data = StringOptionals{s: null, t: "hi"};
    }
}