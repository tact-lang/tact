struct BigNested1 {
    a: Int;
    b: Bool;
}

struct BigNested2 {
    c: String;
    d: Address;
    e: Bool?;
}

struct ContainsMany {
    f1: Int;
    f2: Bool;
    f3: String?;
    f4: Bool?;
    f5: Address?;
    f6: BigNested1;
    f7: BigNested2?;
}

contract ManyNestedFields {
    state: ContainsMany;

    init() {
        self.state = ContainsMany{
            f1: 1,
            f2: false,
            f3: null,
            f4: null,
            f5: null,
            f6: BigNested1{a: 7, b: true},
            f7: null
        };
    }
}
