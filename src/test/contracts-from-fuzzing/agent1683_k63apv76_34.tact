struct OptionalBool {
    test: Bool?;
}

contract TestContract {
    o1: OptionalBool = OptionalBool{ test: true };
    o2: OptionalBool = OptionalBool{ test: null };
}