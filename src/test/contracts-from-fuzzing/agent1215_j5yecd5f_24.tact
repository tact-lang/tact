struct Nested {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract ChainOptOpt(
    opt1: Nested?,
    opt2: Nested?,
    opt3: Nested?,
    opt4: Nested?,
    opt5: Nested?,
) {}