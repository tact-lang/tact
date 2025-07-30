struct Deepest {
    val: Int;
}

struct Inner2 {
    deep: Deepest;
    flag: Bool;
}

struct Inner1 {
    nested: Inner2;
    str: String;
}

contract ManyNested {
    info: Inner1;

    init() {
        self.info = Inner1{
            nested: Inner2{
                deep: Deepest{ val: 42 },
                flag: true,
            },
            str: "nesting",
        };
    }
}