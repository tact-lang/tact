struct S {
    s1: Int;
    s2: Bool;
}

contract FieldsDefaultInit {
    foo: S = S{
        s1: 1,
        s2: false
    };
}