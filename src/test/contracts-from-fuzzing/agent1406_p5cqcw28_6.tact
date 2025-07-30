struct Bag {
    val: Int;
    note: String?;
}

contract ParamTest(
    foo: Int,
    bar: Bool,
    bag: Bag,
    maybe: Bag?,
    title: String,
) {}