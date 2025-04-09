struct Inner1 {
    fieldA: String;
    flagA: Bool;
}

struct Inner2 {
    fieldB: Address;
    flagB: Bool;
}

struct BigNested {
    one: Inner1;
    two: Inner2;
    note: String?;
}

contract NestedVariants {
    complex: BigNested;

    init() {
        self.complex = BigNested{
            one: Inner1{ fieldA: "A", flagA: false },
            two: Inner2{ fieldB: myAddress(), flagB: true },
            note: null
        };
    }
}
