struct OptionalNested {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract OptNestedContract {
    stored: OptionalNested = OptionalNested {
        x: null,
        y: null,
        z: null
    };

    receive() {}
}