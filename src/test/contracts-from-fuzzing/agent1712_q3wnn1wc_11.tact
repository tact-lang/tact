struct InnerMost { value: Int }

struct Middle { inner: InnerMost }

struct OuterMost {
    middle: Middle;
    title: String;
    flag: Bool;
    optionalInt: Int?;
    optionalString: String?;
}

contract MixedDeep {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            middle: Middle{ inner: InnerMost{ value: 42 } },
            title: "Deep",
            flag: true,
            optionalInt: null,
            optionalString: null
        };
    }
}