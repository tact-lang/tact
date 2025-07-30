struct ContainsString {
    s: String;
    t: String?;
}

struct NestedStringStruct {
    inner: ContainsString;
    msg: String;
}

contract TestContract {
    x: NestedStringStruct;

    init() {
        self.x = NestedStringStruct{
            inner: ContainsString{
                s: "abc",
                t: null
            },
            msg: "xyz"
        };
    }
}