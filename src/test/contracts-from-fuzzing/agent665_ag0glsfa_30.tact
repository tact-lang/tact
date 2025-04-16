struct OuterMost {
    innermost: MiddleLayer;
}

struct MiddleLayer {
    val: DeepNestedLayer;
}

struct DeepNestedLayer {
    a: Int;
    b: Bool;
    c: String?;
}

contract DeeplyNestedComplex {
    f: OuterMost = OuterMost{
        innermost: MiddleLayer{
            val: DeepNestedLayer{a:1,b:true,c:null}
        }
    };

    init() {
        self.f = self.f;
    }

    receive() {
        let _ = self.f;
    }
}