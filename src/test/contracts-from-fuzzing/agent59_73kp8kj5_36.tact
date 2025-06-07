struct SOpt {
    foo: Int?;
    bar: String?;
}

contract WithOptionalStructValue {
    s: SOpt = SOpt{ foo: null, bar: null };
}
