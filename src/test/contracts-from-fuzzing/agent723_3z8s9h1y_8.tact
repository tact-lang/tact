struct BigNested {
    nested1: Nested1;
    nested2: Nested2;
}

struct Nested1 {
    intField: Int;
    boolField: Bool;
    optString: String?;
}

struct Nested2 {
    stringField: String;
    addressField: Address;
    optInt: Int?;
}

contract TestContract {
    big: BigNested;

    init() {
        self.big = BigNested{
            nested1: Nested1{ intField: 11, boolField: true, optString: null },
            nested2: Nested2{ stringField: "s", addressField: myAddress(), optInt: 5 },
        };
    }
}