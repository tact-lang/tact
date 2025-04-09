struct ManyOptionalFields {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Int?;
    o5: Bool?;
}

contract TestContract {
    data: ManyOptionalFields;

    init() {
        self.data = ManyOptionalFields{ o1:null, o2:null, o3:true, o4:42, o5:null };
    }
}