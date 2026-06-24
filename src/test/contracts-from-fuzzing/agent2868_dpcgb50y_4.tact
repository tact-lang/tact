struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract ManyOptionalsStorage {
    many: ManyOptionals;
    
    init() {
        self.many = ManyOptionals{};
    }
}