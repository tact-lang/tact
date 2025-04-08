struct OptionalStruct {
    optInt: Int?;
}

contract ManyOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: OptionalStruct = OptionalStruct{optInt: null};
}