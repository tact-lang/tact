// Attempt mix of various types with optionals, defaults, nesting
struct MixStruct {
    x: Int?;
    y: Bool = false;
    z: String?;
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: String = "def";
}

contract MixComplex {
    myField: MixStruct;

    init() {
        self.myField = MixStruct{
            x: null,
            y: true,
            z: "hello",
            inner: InnerStruct{
                a: 5,
                b: "inner"
            }
        };
    }
}