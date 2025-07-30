struct StructWithManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
    f: String;
    g: String;
    h: String;
}

contract ManyStringsInStruct {
    val: StructWithManyStrings;
    init() {
        self.val = StructWithManyStrings{
            a:"a", b:"b", c:"c", d:"d",
            e:"e", f:"f", g:"g", h:"h"
        };
    }
}
