struct InnerS {
    a: Int?;
    b: String?;
}
contract ContrParamOptStructFields(
    inner: InnerS?,
    foo: Int?,
    bar: String,
) {
    receive(){}
}