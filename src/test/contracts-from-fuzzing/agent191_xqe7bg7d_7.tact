struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
}

contract ManyFieldsTest {
    store: BigStruct;

    init() {
        self.store = BigStruct{
            a:1, b:true, c:"a",
            d:2, e:false, f:"b",
            g:3, h:true, i:"c",
            j:4
        };
    }
}