struct ContainsOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    list: ContainsOptionals;
    init() {
        self.list = ContainsOptionals{ a:null, b:null, c:null };
    }
}