struct BigStruct {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    b1: Bool;
    b2: Bool;
    str1: String;
    str2: String;
    str3: String;
    flag: Bool?;
}

contract LotsOfFields {
    val: BigStruct;
    init() {
        self.val = BigStruct{
            i1: 1, i2: 2, i3: 3, i4: 4, i5: 5,
            b1: true, b2: false,
            str1: "a", str2: "b", str3: "c",
            flag: null,
        };
    }
}