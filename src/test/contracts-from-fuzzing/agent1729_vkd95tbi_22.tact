struct OptionalString {
    s: String?;
}

struct OuterOpt {
    innerOpt1: OptionalString?;
    innerOpt2: OptionalString?;
}

contract StringOptionals {
    data: OuterOpt?;
}