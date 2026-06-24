struct InnerFields {
    a: Int;
    b: Bool;
}

contract DefaultStructField {
    sf: InnerFields = InnerFields{ a: 51, b: true };
}