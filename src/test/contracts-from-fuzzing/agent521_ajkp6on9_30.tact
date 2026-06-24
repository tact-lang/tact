struct SDeep {
    a: Int?; b: Bool?; c: Address?;
}

struct S {
    one: SDeep;
    two: SDeep;
    three: SDeep;
}

contract DeepOptions {
    val: S;

    init() {
        self.val = S{
            one: SDeep{a:null,b:null,c:null},
            two: SDeep{a:7,b:true,c:myAddress()},
            three: SDeep{a:null,b:true,c:null},
        };
    }
}