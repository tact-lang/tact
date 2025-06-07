struct OptionalField {
    a: Int?;
    b: Bool;
}

contract OptionalAndNonOptional {
    f: OptionalField = OptionalField{a:null, b:true};
}