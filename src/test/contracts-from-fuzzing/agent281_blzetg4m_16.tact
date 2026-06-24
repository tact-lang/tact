// Contract with nested struct containing many primitive fields
struct MixedStruct {
    foo: Int;
    bar: Bool;
    text: String;
    num: Int;
}

contract MixNestedStorage {
    val: MixedStruct;

    init() {
        self.val = MixedStruct{
            foo: 1,
            bar: true,
            text: "abc",
            num: 42
        };
    }
}