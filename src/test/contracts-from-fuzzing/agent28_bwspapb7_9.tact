struct BigStruct {
    f01: Int; f02: Int; f03: Bool; f04: Bool; f05: String;
    f06: Int; f07: Bool; f08: String; f09: Int; f10: String;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            f01: 1, f02: 2, f03: true, f04: false, f05: "a",
            f06: 6, f07: true, f08: "b", f09: 9, f10: "c"
        };
    }
}