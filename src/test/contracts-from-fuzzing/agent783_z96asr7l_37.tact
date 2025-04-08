struct Comb {
    b: Bool;
    s: String;
    opt: Int?;
}

contract StructRepeated {
    f1: Comb = Comb { b:true, s:"A", opt:null };
    f2: Comb = Comb { b:false, s:"B", opt:null };
    f3: Comb = Comb { b:true, s:"C", opt:null };
}