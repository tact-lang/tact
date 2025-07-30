struct LongStringFields {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
    f: String;
    g: String;
    h: String;
    i: String;
    j: String;
}

contract ManyStrings {
    val: LongStringFields;
    init() {
        self.val = LongStringFields{
            a:"a",b:"b",c:"c",d:"d",e:"e",
            f:"f",g:"g",h:"h",i:"i",j:"j" 
        };
    }
}