struct MixedPrims {
    i: Int;
    b: Bool;
    s: String;
}

contract TopMixedStructs {
    p1: MixedPrims;
    p2: MixedPrims;

    init() {
        self.p1=MixedPrims{i:1,b:true,s:"foo"};
        self.p2=MixedPrims{i:2,b:false,s:"bar"};
    }

    receive() {
        let p1 = self.p1;
        let p2 = self.p2;
    }
}