struct ManyStr {
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

contract TestContract {
    m: ManyStr;

    init() {
        self.m = ManyStr{
            a:"a",b:"b",c:"c",d:"d",e:"e",
            f:"f",g:"g",h:"h",i:"i",j:"j"
        };
    }

    receive() {
        self.m = ManyStr{
            a:"A",b:"B",c:"C",d:"D",e:"E",
            f:"F",g:"G",h:"H",i:"I",j:"J"
        };
    }
}