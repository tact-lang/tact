struct Alpha {
    intVal: Int;
}
struct Beta {
    intVal: Int;
}
struct Gamma {
    intVal: Int;
}

contract MultiStructs {
    a: Alpha;
    b: Beta;
    c: Gamma;
    init() {
        self.a = Alpha{intVal:1};
        self.b = Beta{intVal:2};
        self.c = Gamma{intVal:3};
    }
}
