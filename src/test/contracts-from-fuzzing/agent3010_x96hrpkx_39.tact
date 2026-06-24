struct Wrapper {
    nested: Int;
}

contract FieldWithNoDefault {
    f: Wrapper = Wrapper{ nested: 1 };
}
