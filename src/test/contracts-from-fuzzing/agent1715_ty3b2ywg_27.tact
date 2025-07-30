struct OptionalStringIntBool {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract TestContract {
    val: OptionalStringIntBool = OptionalStringIntBool{
        s: null,
        i: null,
        b: null
    };
}