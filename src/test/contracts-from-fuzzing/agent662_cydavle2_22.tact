struct MultiOption {
    f1: Int?;
    f2: Int?;
    f3: String?;
    f4: Bool?;
}

contract MultiOptionTest {
    data: MultiOption;
    init() {
        self.data = MultiOption{ f1:null, f2:2, f3:null, f4:true };
    }
}