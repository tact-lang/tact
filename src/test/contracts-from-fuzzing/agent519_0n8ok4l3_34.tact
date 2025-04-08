struct ContainsManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract ManyStringsStruct {
    data: ContainsManyStrings;

    init() {
        self.data = ContainsManyStrings{
            a:"a",b:"b",c:"c",d:"d",e:"e"
        };
    }
}