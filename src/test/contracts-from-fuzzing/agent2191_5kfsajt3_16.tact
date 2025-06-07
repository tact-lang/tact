struct Weird {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: Int;
}

contract WeirdFields {
    val: Weird;

    init() {
        self.val = Weird{
            a:null,
            c:null,
            d:555,
            b:false
        };
    }
}
