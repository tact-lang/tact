struct HasString {
    s: String;
}

struct Holder {
    one: HasString;
    two: HasString;
}

contract MultiStrings {
    data: Holder;

    init() {
        self.data = Holder{
            one: HasString{s:"abc"},
            two: HasString{s:"def"}
        };
    }
}