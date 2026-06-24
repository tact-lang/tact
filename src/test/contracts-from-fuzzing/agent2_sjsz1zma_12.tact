struct OptDeep {
    s: Int?;
}

struct MaybeInner {
    nest: OptDeep?;
}

contract OptionalNest {
    field: MaybeInner = MaybeInner{ nest: null };
}