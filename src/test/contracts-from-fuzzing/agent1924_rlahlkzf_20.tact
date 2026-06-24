struct NestedWithOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestContract {
    payload: NestedWithOptional;

    init() {
        self.payload = NestedWithOptional{
            inner: InnerStruct{
                a: 777,
                b: null,
                c: "hey"
            }
        };
    }
}