struct Mixed {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
}

contract TestContract {
    m: Mixed;
    
    init() {
        self.m = Mixed{
            a: 11,
            b: null,
            c: "hi"
        };
    }
}