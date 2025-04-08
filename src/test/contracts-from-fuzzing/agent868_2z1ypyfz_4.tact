struct SimpleOpt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptContract {
    s: SimpleOpt = SimpleOpt{ foo: null, bar: true, baz: null };
}