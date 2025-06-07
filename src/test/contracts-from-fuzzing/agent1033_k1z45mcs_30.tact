struct SimpleOptionals {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract OptsInState {
    vals: SimpleOptionals;

    init() {
        self.vals = SimpleOptionals{ one: null, two: null, three: "hi" };
    }
}