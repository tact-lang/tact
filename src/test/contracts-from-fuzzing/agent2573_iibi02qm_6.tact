struct Info {
    number: Int;
    flag: Bool;
    label: String;
    desc: String?;
}

contract StructWithLongStrings {
    meta: Info;

    init() {
        self.meta = Info{
            number: 123,
            flag: true,
            label: "short",
            desc: "This is a very long optional description string to test persistence serialization" 
        };
    }
}