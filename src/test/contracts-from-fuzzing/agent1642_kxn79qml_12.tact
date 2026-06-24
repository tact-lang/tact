struct Letters {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
    f: String;
    g: String;
}

contract LettersFields {
    storage: Letters;

    init() {
        self.storage = Letters{
            a:"a",b:"b",c:"c",d:"d",e:"e",f:"f",g:"g"
        };
    }
}