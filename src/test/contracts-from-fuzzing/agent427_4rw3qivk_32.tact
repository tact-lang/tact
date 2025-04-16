struct ComboStruct {
    foo: Int;
    bar: Int?;
    baz: Bool?;
    msg: String;
}

contract ComboStorage {
    val: ComboStruct;

    init() {
        self.val = ComboStruct{
            foo: 100,
            bar: null,
            baz: null,
            msg: "combo"
        };
    }
}