struct First {
    a: Int;
    b: Int;
}

struct Second {
    fa: First;
    flag: Bool;
}

struct Third {
    sa: Second;
    text: String;
}

contract NestedManyLevels {
    val: Third;

    init() {
        self.val = Third{
            sa: Second{
                fa: First{ a:1, b:2 },
                flag: true
            },
            text: "hi"
        };
    }
}