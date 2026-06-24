struct NestedOptionals {
    optStruct: OptionalSubStruct?;
}

struct OptionalSubStruct {
    intVal: Int?;
    boolVal: Bool?;
    addressVal: Address?;
}

contract TestNestedOpt {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            optStruct: OptionalSubStruct{
                intVal: null,
                boolVal: null,
                addressVal: null
            }
        };
    }
}
