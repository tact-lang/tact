struct S {
    f1: Int;
    f2: String; 
}

contract OptionalStructField {
    s: S?;

    init() {
        self.s = S{
            f1: 5,
            f2: "hi"
        };
    }
}