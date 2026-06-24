struct OptionalBool {
    bit: Bool?;
}

contract TestContract {
    opt: OptionalBool = OptionalBool{
        bit: null
    };
}