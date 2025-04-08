contract NestedInitMissing {
    outer: OuterType;

    init() {
        self.outer = OuterType{ a:5, nest: NestedType{ b:true, sub:null } };
    }
}

struct OuterType {
    a: Int;
    nest: NestedType;
}

struct NestedType {
    b: Bool;
    sub: SubType?;
}

struct SubType {
    txt: String;
}