struct Details {
    val: Int?;
    okay: Bool?;
    message: String?;
}

contract Test {
    d: Details?;

    init() {
        self.d = Details{ val:null, okay:true, message:null };
    }
}