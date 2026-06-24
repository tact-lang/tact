struct SOptInts {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OnlyOptionals {
    val: SOptInts = SOptInts{ a: null, b: null, c: null };
}
