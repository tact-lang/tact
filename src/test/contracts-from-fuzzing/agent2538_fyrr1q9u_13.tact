struct SOpt {
    a: Int?;
    b: Bool?;
}

contract InlineInitOpt {
    s: SOpt = SOpt{ a:null, b:true };
}