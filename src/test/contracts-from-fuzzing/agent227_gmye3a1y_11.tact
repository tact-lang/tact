struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: String?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{ a:null, b:null, c:null, d:42, e:"hello" };
    }
}