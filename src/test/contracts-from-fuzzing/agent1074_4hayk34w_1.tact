struct NestedStruct { field1: Int; optionalInner: InnerStruct?; }

struct InnerStruct { number: Int; flag: Bool; text: String; }

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct {
            field1: 1,
            optionalInner: InnerStruct {
                number: 42,
                flag: true,
                text: "hello"
            }
        };
    }
}