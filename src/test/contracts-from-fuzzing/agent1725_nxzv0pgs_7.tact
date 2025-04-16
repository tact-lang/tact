struct OptionalNested {
    s: InnerStruct?;
}

struct InnerStruct {
    s2: Innermost?;
}

struct Innermost {
    x: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            s: InnerStruct{
                s2: null
            }
        };
    }
}