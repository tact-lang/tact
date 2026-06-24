struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract TestManyStrings {
    val: ManyStrings;
    init() {
        self.val = ManyStrings{
            a:"a",b:"b",c:"c",d:"d",e:"e"
        };
    }
}
