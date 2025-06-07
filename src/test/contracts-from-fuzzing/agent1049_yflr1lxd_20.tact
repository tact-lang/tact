struct SOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ManyOptionals {
    so: SOptionals;

    init() {
        self.so = SOptionals{ a:null, b:null, c:null };
    }
}