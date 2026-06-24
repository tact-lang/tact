struct Alpha {
    val: Int?;
    flag: Bool?;
    name: String?;
}

contract MultipleOptionals {
    a: Alpha?;
    b: Alpha?;
    c: Alpha?;
    
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}