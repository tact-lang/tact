struct MyStruct {
    val: Int;
    flag: Bool?;
    text: String;
}

contract FieldOrdering {
    s: MyStruct;
    init() {
        self.s = MyStruct{
            val: 42,
            flag: null,
            text: "ordering"
        };
    }
}