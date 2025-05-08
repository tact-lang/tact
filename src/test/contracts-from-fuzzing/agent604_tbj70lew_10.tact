struct NestedString {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract StringsStorage {
    s1: NestedString;
    s2: NestedString;
    s3: NestedString;

    init() {
        self.s1 = NestedString{a:"a",b:"b",c:"c",d:"d"};
        self.s2 = NestedString{a:"e",b:"f",c:"g",d:"h"};
        self.s3 = NestedString{a:"i",b:"j",c:"k",d:"l"};
    }
    receive() {
        dump(self.s1.a);
        dump(self.s2.b);
        dump(self.s3.c);
    }
}