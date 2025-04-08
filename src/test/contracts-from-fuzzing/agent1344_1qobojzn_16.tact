// Contract field with optional struct, struct has optional field
struct OptionalField {
    f1: Int?;
    f2: Bool?;
}

contract OptionalInOptional {
    data: OptionalField?;

    init() {
        self.data = OptionalField{f1:null,f2:true};
    }
}
