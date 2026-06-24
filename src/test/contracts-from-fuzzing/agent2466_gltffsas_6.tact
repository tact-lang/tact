struct SOpt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract UseSOpt {
    val: SOpt = SOpt{foo: null, bar: null, baz: null};
    init() {}
}