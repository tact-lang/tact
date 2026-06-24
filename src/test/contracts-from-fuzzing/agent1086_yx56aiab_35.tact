struct ComposeNested {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
    s: String;
}

contract ComposeNestedContract {
    data: ComposeNested;

    init() {
        self.data = ComposeNested{
            inner: InnerStruct{
                x:1,
                y:true,
                s:"hi"
            }
        };
    }
}