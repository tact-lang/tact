struct O1 {
    x: Int;
}

struct OptionalS {
    inner: O1?;
    val: Int?;
}

contract OptionalNested {
    s: OptionalS = OptionalS{inner: null, val: null};
}