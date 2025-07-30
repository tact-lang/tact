struct LargeNested {
    s1: LargeStrings;
    s2: LargeStrings;
}

struct LargeStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            s1: LargeStrings{
                s1: "A", s2: "B", s3: "C"
            },
            s2: LargeStrings{
                s1: "D", s2: "E", s3: "F"
            }
        };
    }
}