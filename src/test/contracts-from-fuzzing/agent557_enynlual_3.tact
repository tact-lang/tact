struct Nested2 {
    deepField: Int?;
    booleanThing: Bool;
}

struct Middle2 {
    nested: Nested2;
    flagger: Bool?;
}

struct Top2 {
    middle: Middle2;
    simple: Int;
    optSimple: Int?;
    name: String;
}

contract TestContract {
    data: Top2;

    init() {
        self.data = Top2{
            middle: Middle2{
                nested: Nested2{deepField:null, booleanThing:false},
                flagger: null
            },
            simple: 7,
            optSimple:null,
            name: "hi"
        };
    }
}