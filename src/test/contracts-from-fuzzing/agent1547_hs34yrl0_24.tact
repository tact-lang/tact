struct NestedStructs {
    one: Int;
    two: Nested2;
}

struct Nested2 {
    three: Nested3;
}

struct Nested3 {
    four: Int;
    five: String;
}

contract NestedContract {
    nest: NestedStructs;

    init() {
        self.nest = NestedStructs{
            one: 10,
            two: Nested2{
                three: Nested3{
                    four: 20,
                    five: "str"
                }
            }
        };
    }
}