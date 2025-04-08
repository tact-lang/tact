struct Third {
    x: Int;
}

struct Second {
    t: Third?;
}

struct First {
    s: Second?;
}

contract DeepAllOptional {
    deepField: First;

    init() {
        self.deepField = First{
            s: null
        };
    }
}