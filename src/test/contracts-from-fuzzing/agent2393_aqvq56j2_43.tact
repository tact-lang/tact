struct InnerDeepOpt {
    a: Int? as uint64;
    b: Bool?;
    s: String?;
}

contract DeepOptStore {
    dd: InnerDeepOpt = InnerDeepOpt{ a:null, b:true, s:null };
}