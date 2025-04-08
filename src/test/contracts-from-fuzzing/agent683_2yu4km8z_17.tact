struct WithManyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract StringHeavy {
    data: WithManyStrings;

    init() {
        self.data = WithManyStrings{
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four"
        };
    }
}