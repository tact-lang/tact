struct StringsAndBools {
    a: String;
    b: Bool;
    c: String;
    d: Bool;
}

contract MixStringBool {
    data: StringsAndBools;

    init() {
        self.data = StringsAndBools{
            a:"A", b:true, c:"C", d:false
        };
    }
}
