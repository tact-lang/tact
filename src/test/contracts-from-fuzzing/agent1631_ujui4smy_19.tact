struct DeepMix {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell?;
    e: Slice;
    f: Address?;
    g: Builder;
}

contract MixedIn {
    m: DeepMix;

    init() {
        self.m = DeepMix{
            a:1,b:null,c:"hi",d:null,e:emptyCell().asSlice(),f:null,g:beginCell()
        };
    }
}