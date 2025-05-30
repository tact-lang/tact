struct NullTest {
    n1: Int?;
    n2: Bool?;
    n3: String?;
}

contract TestContract {
    data: NullTest = NullTest{ n1:null, n2:null, n3:null };

    init() {
        self.data = NullTest{ n1:null, n2:null, n3:null };
    }
}