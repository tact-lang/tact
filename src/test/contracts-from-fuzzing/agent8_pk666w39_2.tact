struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    maybeInt: Int?;
    subInner: SubInner;
}

struct SubInner {
    flag: Bool;
    text: String;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            inner: InnerStruct{
                maybeInt: null,
                subInner: SubInner{
                    flag: true,
                    text: "abc"
                }
            }
        };
    }
}