struct S {
    s: String?;
}

contract MixOptPrimStruct {
    a: Int? = 1;
    b: Bool? = null;
    c: String? = null;
    d: S = S{s: "yo"};
}