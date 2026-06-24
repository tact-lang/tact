struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
}

contract NullableStructFields {
    f: ManyOptions = ManyOptions{a:null,b:null,c:null,d:null};
}