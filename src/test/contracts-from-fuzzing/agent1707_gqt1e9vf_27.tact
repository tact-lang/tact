struct AllStrings {
    a: String;
    b: String;
    c: String;
}

contract StrsContract {
    all: AllStrings;

    init() {
        self.all = AllStrings{
            a: "a",
            b: "b",
            c: "c"
        };
    }
}