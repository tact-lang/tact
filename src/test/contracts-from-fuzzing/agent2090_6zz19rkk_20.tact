message(5) SimpleMsg {
    foo: Int;
    bar: String?;
}

contract InlineOptMsg {
    m: SimpleMsg? = null;

    init() { }
}