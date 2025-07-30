struct NestedOptionalStruct {
    inn: Int?;
    boo: Bool;
}

contract OptionalStructField {
    maybe: NestedOptionalStruct?;

    init() {
        self.maybe = NestedOptionalStruct{inn:null, boo:true};
    }
}
