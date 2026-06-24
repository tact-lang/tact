contract LongOptionalTail {
    a: Int;
    b: Bool;
    c: String;
    tail1: String?;
    tail2: Int?;
    tail3: Bool?;
    tail4: String?;
    tail5: Int?;

    init() {
        self.a=1;
        self.b=true;
        self.c="hi";
        self.tail1=null;
        self.tail2=null;
        self.tail3=true;
        self.tail4="yo";
        self.tail5=5;
    }
}