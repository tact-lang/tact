struct DeepNestedStrings {
    a: String;
    next: NextLevel?;
}

struct NextLevel {
    b: String;
    next2: NextLevel2?;
}

struct NextLevel2 {
    c: String;
}

contract VeryDeepStrings {
    d: DeepNestedStrings;

    init() {
        self.d = DeepNestedStrings{
            a:"a",
            next: NextLevel{
                b:"b",
                next2:null
            }
        };
    }
}