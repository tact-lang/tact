struct SubOpt {
    foo: Int? = null;
    bar: Bool? = true;
}

struct BigStruct {
    a: Int;
    b: String;
    c: SubOpt?;
}

contract MixedEverything {
    state: BigStruct;

    init() {
        self.state = BigStruct{
            a: 2024,
            b: "TON",
            c: null
        };
    }
}