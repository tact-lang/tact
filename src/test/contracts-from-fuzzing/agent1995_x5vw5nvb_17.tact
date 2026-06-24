struct Sub1 { a: Int; }
struct Sub2 { b: Bool; }
struct Sub3 { c: String; }
struct CompositeOpt {
    s1: Sub1?;
    s2: Sub2?;
    s3: Sub3?;
    intVal: Int?;
    strVal: String?;
    boolVal: Bool?;
}

contract OptionalEmbedded {
    val: CompositeOpt;
    init() {
        self.val = CompositeOpt{
            s1: null, s2: null, s3: null,
            intVal: null, strVal: null, boolVal: null
        };
    }
}