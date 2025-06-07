struct Annotated {
    little: Int as uint8;
    big: Int as int64;
}

contract StructWithSerialization {
    inner: Annotated = Annotated{ little: 42, big: -42424242 };
}