struct OptionalS {
    s: String?;
}

contract OptionalStringInsideStruct {
    s: OptionalS = OptionalS{ s: null };
}