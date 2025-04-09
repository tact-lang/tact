struct WithManyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract TestContract {
    data: WithManyStrings = WithManyStrings{
        s1: "one", s2: "two", s3: "three", s4: "four", s5: "five"
    };

    init() {
        self.data = WithManyStrings{
            s1: "six", s2: "seven", s3: "eight", s4: "nine", s5: "ten"
        };
    }
}