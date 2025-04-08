struct OptionalNest {
    inner: Int?;
}

contract OptStructVar {
    s: OptionalNest = OptionalNest{ inner: null };
}