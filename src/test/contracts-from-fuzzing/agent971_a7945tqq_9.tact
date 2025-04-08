struct Struct1 { a: Int; }
struct Struct2 { b: Bool; }
struct Struct3 { c: String; }

struct Nest {
    s1: Struct1?;
    s2: Struct2?;
    s3: Struct3?;
}

contract OptStructs {
    data: Nest;

    init() {
        self.data = Nest{
            s1: null,
            s2: null,
            s3: null
        };
    }
}