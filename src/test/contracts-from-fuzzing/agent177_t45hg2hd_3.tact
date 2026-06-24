struct Level3 {
    d: Bool = true;
}

struct Level2 {
    c: Int = 7;
    l3: Level3;
}

struct Level1 {
    a: String = "hi";
    b: Int = 1;
    l2: Level2;
}

contract OptionalNestedContract {
    optionalField: Level1?; // optional deeply nested struct

    init() {
        self.optionalField = Level1{
            a: "there",
            b: 2,
            l2: Level2{
                c: 3,
                l3: Level3{ d: false }
            }
        };
    }
    receive(){}
}