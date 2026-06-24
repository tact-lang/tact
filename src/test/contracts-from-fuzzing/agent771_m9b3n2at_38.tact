contract StringOptionalCross {
    a: String?;
    b: String;
    c: String?;

    init() {
        self.a=null;
        self.b="hello";
        self.c=null;
    }
}