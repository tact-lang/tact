struct SOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract OptStructTest {
    val: SOptional = SOptional{a: null, b: null, c: null, d: null, e: null};
}