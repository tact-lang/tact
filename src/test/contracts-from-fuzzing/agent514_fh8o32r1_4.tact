struct WithOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: String?;
}

contract OptionalFields {
    data: WithOptionals;
    init() {
        self.data = WithOptionals{
            a:null, b:42, c:true, d:null, e:"hello"
        };
    }
}