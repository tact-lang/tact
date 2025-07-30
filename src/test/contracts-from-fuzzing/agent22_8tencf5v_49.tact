// Chain of structs mixing optionals with direct nested composite
struct S3 { f:Int; s:String; }
struct S2 { s:S3; }
struct S1 { s:S2?; }

contract MixedChain {
    top:S1;

    init() {
        self.top = S1{ s:null };
    }
}