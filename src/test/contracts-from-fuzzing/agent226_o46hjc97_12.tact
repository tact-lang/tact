struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }

struct MixedNested {
    x: S1;
    y: S2;
    z: S3;
}

contract ContractMixedNested {
    data: MixedNested;

    init() {
        self.data = MixedNested{
            x: S1{a:10},
            y: S2{b:true},
            z: S3{c:"hi"}
        };
    }
}
