struct Inner {
    s: String;
    b: Bool;
    o: Int?;
}

contract StructConst {
    data: Inner = Inner{s:"hi",b:true,o:null};
}