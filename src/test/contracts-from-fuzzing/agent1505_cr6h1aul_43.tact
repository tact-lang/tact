struct BigOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract ManyOptStruct {
    f: BigOpt?;
    init() {
        self.f = null;
    }
}