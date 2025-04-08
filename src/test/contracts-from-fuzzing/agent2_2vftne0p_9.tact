struct StringStruct {
    s1: String;
    s2: String;
}

contract TestContract {
    strs: StringStruct;

    init() {
        self.strs = StringStruct{
            s1: "hello",
            s2: "world",
        };
    }
}