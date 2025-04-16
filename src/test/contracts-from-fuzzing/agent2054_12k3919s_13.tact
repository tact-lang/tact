struct StringNest {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract ManyStrings {
    field: StringNest = StringNest{
        a:"a",b:"b",c:"c",d:"d",e:"e"
    };
}