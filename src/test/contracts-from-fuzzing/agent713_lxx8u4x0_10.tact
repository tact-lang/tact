struct StringHeavy {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract ManyStringsTest {
    val: StringHeavy;
    init() {
        self.val = StringHeavy{
            a:"a",b:"b",c:"c",d:"d",e:"e"
        };
    }
}