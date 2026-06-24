struct MyStruct {
    x: Int as int4;
    y: Bool;
    s: String;
}

contract SerializedStruct {
    val: MyStruct;

    init() {
        self.val = MyStruct{ x: 7, y: true, s: "yo" };
    }
}