struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct DeepStruct {
    inner: DeepOptional;
}

contract TestContract {
    val: DeepStruct = DeepStruct{inner: DeepOptional{a: null, b: null, c: null, d: null, e: null, f: null}};
}