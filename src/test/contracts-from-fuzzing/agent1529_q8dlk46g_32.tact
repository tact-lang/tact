// complex mixed structure, optionals and nesting
struct InnerMost { x:Int; }
struct Mid { inner: InnerMost?; }
struct Outer { mid:Mid?; label:String; }

contract MixedComplex {
    val: Outer;

    init() {
        self.val = Outer{
            mid: null,
            label: "yo"
        };
    }
}