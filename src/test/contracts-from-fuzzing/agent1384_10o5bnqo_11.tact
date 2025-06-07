struct OptionalFields {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
}

struct NestedOptionals {
    inner: OptionalFields;
    val: Int?;
}

contract ComboOptional {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            inner: OptionalFields{
                o1:null, o2:true, o3:"x", o4:null
            },
            val: 99,
        };
    }
}