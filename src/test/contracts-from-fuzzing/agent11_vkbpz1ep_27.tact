// struct with all optional fields
struct NullablePack {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    data: NullablePack;

    init() {
        self.data = NullablePack{
            a:null,b:null,c:null,d:null
        };
    }
}