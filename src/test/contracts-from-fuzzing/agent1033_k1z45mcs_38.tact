struct Inn {
    i: Int;
    b: Bool;
}

struct Oute {
    inn: Inn;
    s: String;
}

contract MixedNestedFields {
    data: Oute;

    init() {
        self.data = Oute{
            inn: Inn{ i: 10, b: false },
            s: "hi"
        };
    }
}