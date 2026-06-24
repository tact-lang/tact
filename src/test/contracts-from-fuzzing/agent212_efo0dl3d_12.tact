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
    k: Bool;
    l: String;
    m: Int;
    n: Bool;
    o: String;
    p: Int;
    q: Bool;
    r: String;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a:1, b:true, c:"a",
            d:2, e:false, f:"b",
            g:3, h:true, i:"c",
            j:4, k:false, l:"d",
            m:5, n:true, o:"e",
            p:6, q:false, r:"f"
        };
    }
}