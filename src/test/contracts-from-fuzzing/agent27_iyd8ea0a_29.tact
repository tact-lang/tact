struct ManyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract LotsOfStrings {
    heap: ManyStrings;

    init() {
        self.heap = ManyStrings{
            s1: "a",
            s2: "b",
            s3: "c",
            s4: "d"
        };
    }
}