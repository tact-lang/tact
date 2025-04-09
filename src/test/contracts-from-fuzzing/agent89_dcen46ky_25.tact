struct ManyOptional {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: Int?;
    f5: String?;
    f6: Bool?;
}

contract Fuzz25 {
    data: ManyOptional?;

    init() {
        self.data = null;
    }
}