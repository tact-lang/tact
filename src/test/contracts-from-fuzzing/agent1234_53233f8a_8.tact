struct S1 { a: Int; b: Bool; }
struct S2 { s1: S1; c: String; }
struct S3 { s2: S2; d: Int?; }

struct S4 { x: S1; y: S2; z: S3; }

contract DeepWideCombo {
    stored: S4;

    init() {
        self.stored = S4{
            x: S1{a:1, b:true},
            y: S2{s1: S1{a:2, b:false}, c: "ok"},
            z: S3{
                s2: S2{s1: S1{a:3, b:true}, c: "yo"},
                d: null
            }
        };
    }
}