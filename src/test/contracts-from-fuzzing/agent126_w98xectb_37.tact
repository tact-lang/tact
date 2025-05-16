struct Strs {
    s1: String; s2: String; s3: String;
    s4: String; s5: String; s6: String;
}

contract ManyStrFields {
    data: Strs;

    init() {
        self.data = Strs{
            s1:"a", s2:"b", s3:"c",
            s4:"d", s5:"e", s6:"f"
        };
    }
}