struct NestedOptStruct {
    intVal: Int;
    optString: String?;
}

struct MidStruct {
    flag: Bool;
    nested: NestedOptStruct?;
    anotherInt: Int;
}

contract TestContract {
    m: MidStruct?;

    init() {
        self.m = MidStruct{
            flag: true,
            nested: NestedOptStruct{
                intVal: 5,
                optString: null
            },
            anotherInt: 42
        };
    }
}