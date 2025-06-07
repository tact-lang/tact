struct OptionalInner { 
    val: Int?; 
    flag: Bool;
}

struct OptionalOuter {
    nested: OptionalInner?;
    note: String;
}

contract PersistenceNestedOptional {
    payload: OptionalOuter?;

    init() {
        self.payload = OptionalOuter{
            nested: OptionalInner{
                val: null,
                flag: false
            },
            note: "hi"
        };
    }
}