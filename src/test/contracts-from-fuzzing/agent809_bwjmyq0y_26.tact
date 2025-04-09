struct ManyNestedStructs {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;
}

struct S {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract NestedMany {
    data: ManyNestedStructs;

    init() {
        self.data = ManyNestedStructs{
            s1: S{ intVal:1, boolVal:true, strVal:"a" },
            s2: S{ intVal:2, boolVal:false, strVal:"b" },
            s3: S{ intVal:3, boolVal:true, strVal:"c" },
            s4: S{ intVal:4, boolVal:false, strVal:"d" },
            s5: S{ intVal:5, boolVal:true, strVal:"e" }
        };
    }
}