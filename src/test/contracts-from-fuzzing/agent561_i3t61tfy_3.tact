struct DeepNested {
    a: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    s: SubStruct;
}

struct SubStruct {
    txt: String;
    z: Int;
}

contract DeepStorage {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            a: 1,
            inner: InnerStruct{
                flag: true,
                s: SubStruct{txt: "hi", z: 33}
            }
        };
    }
}