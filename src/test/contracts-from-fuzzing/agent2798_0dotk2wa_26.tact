struct OptAllNull {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptAllNullContract {
    data: OptAllNull;

    init() {
        self.data = OptAllNull{
            a:null,
            b:null,
            c:null
        };
    }
}