struct WithOptFields {
    a: Int?;
    b: String?;
}

contract OptDefaults {
    w: WithOptFields = WithOptFields{a:null,b:null};
}
