struct Mid {
    text: String;  
    flag: Bool;
    optionalVal: Int?;
}

struct Outer {
    mid: Mid;
    name: String;
}

contract MixedNested {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Mid{
                text: "hi",
                flag: true,
                optionalVal: null
            },
            name: "outer"
        };
    }
}
