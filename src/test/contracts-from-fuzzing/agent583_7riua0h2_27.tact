struct MidDefault {
    a: Int = 7;
    b: Bool;
}

struct OuterDefault {
    inside: MidDefault;
}

contract MidDefaultContract {
    val: OuterDefault;

    init() {
        self.val = OuterDefault{
            inside: MidDefault{ b: false },
        };
    }
}