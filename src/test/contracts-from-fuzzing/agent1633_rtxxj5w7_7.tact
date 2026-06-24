struct NestedWithOptionals {
    nest1: SubStruct?;
    nest2: SubStruct?;
}

struct SubStruct {
    a: Int;
    b: Bool;
    s: String?;
}

contract TestContract {
    complex: NestedWithOptionals;

    init() {
        self.complex = NestedWithOptionals{
            nest1: null,
            nest2: SubStruct{
                a: 12,
                b: false,
                s: null,
            },
        };
    }
}