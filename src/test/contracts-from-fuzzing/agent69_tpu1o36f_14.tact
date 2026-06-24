struct EmptyStrings {
    s1: String;
    s2: String;
}

contract EmptyStringTest {
    v: EmptyStrings;

    init() {
        self.v = EmptyStrings{
            s1: "",
            s2: ""
        };
    }
}