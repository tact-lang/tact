struct NestedOptionals {
    s: InnerStruct?;
}

struct InnerStruct {
    x: Int?;
    y: Bool?;
}

contract TestStorage {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            s: InnerStruct{
                x: null,
                y: true,
            }
        };
    }
}