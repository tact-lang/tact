struct MostlyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract MostlyOptionalStruct {
    val: MostlyOptionals;

    init() {
        self.val = MostlyOptionals{ a:null, b:null, c:null, d:null };
    }
}