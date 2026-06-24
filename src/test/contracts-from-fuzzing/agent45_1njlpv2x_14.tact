struct DeepStringStruct {
    f1: String;
    f2: String;
    f3: String;
}

struct Wrapper {
    nested: DeepStringStruct;
    extra: String;
}

contract ManyStrings {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            nested: DeepStringStruct{ f1: "x", f2: "y", f3: "z" },
            extra: "abc"
        };
    }
}
