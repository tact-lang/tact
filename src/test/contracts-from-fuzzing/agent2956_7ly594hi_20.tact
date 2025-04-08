struct EmptyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract ManyStrings {
    s: EmptyStrings;

    init() {
        self.s = EmptyStrings{
            a:"",b:"",c:"",d:"",e:"",
        };
    }
}
