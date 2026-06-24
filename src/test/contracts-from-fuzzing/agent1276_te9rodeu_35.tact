struct InnerMost {
    a: Int;
    b: Int?;            // optional, unset
}

struct Mid {
    m: InnerMost;       // not optional
    note: String = "x"; // defaulted
    flag: Bool?;        // optional, unset
}

contract DeepMixedOptional {
    val: Mid?;         // contract persistent field, optional

    init() {
        self.val = Mid{
            m: InnerMost{ a: 123 },
            // `note` default kept
            // `flag` omitted
        };
    }
}