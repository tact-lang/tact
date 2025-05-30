struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    nopt: NestedOpt = NestedOpt{ a:null, b:true, c:null };
}