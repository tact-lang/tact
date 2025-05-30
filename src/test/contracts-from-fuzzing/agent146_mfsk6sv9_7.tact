struct Params {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    params: Params = Params{ a:null, b:true, c:null };
}