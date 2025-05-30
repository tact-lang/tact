struct SOpt {
    v: Int?;
}

contract OptionalStructWithInnerNull {
    s: SOpt = SOpt{ v: null };
}