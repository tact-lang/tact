struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructStorage {
    val: OptionalFields = OptionalFields{ a:null, b:true, c:null };
    
    init() {
        self.val = OptionalFields{ a:42, b:null, c:"yo" };
    }
}