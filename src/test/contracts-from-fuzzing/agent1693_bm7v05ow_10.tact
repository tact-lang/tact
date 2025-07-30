struct ManyOptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
}

contract ManyOptionalPrimStorage {
    data: ManyOptionalPrimitives;

    init() {
        self.data = ManyOptionalPrimitives{ i:null, b:null, s:null, a:null };
    }
}