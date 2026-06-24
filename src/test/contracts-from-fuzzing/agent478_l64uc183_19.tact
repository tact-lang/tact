struct OptionalString {
    s: String?;
}

struct ContainsOptionalString {
    opt: OptionalString?;
}

contract DoubleOptString {
    val: ContainsOptionalString = ContainsOptionalString{ opt: null };
}