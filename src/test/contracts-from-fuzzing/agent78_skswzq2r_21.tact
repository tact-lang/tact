struct Inner {
    a: Int;
    b: Int?;
}

contract OptionalWithDefault {
    val: Inner = Inner{ a:1, b:null };
}