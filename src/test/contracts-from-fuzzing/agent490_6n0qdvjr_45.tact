struct HasOptionals {
    s: String?;
    n: Int?;
    b: Bool?;
}

contract OptsContract {
    data: HasOptionals;
    init() {
        self.data = HasOptionals{ s:null, n:null, b:null };
    }
}