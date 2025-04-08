struct Mix {
    optInt: Int?;
    str: String;
    flag: Bool;
}

struct Outer {
    nested: Mix;
    text: String;
    flag2: Bool;
}

contract Complex {
    data: Outer;

    init() {
        self.data = Outer {
            nested: Mix {
                optInt: null,
                str: "Hi",
                flag: true
            },
            text: "Outer",
            flag2: false
        };
    }
}