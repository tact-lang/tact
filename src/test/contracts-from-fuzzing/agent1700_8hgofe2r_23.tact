struct Data {
    x: Int?;
    y: Int?;
    s: String?;
}

contract TestContract {
    d: Data;

    init() {
        self.d = Data{ x:null, y:5, s:null };
    }
}