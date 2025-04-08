struct NestStrings {
    a: String;
    b: Strings2;
}

struct Strings2 {
    c: String;
    d: String;
}

contract TestContract {
    val: NestStrings;

    init() {
        self.val = NestStrings{
            a: "X",
            b: Strings2{
                c: "Y",
                d: "Z"
            }
        };
    }
}