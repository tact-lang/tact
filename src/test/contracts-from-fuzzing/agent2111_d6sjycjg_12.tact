// nested optional INSIDE nested struct with multiple types
struct SuperInner {
    x: Int?;
    b: Bool;
}

struct WrappingStruct {
    s: SuperInner?;
}

contract OptionInsideNested {
    data: WrappingStruct;

    init() {
        self.data = WrappingStruct{
            s: SuperInner{
                x: null,
                b: true
            }
        };
    }
}