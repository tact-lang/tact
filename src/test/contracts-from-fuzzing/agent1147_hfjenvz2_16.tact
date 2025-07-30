struct OptIntBool {
    a: Int?;
    b: Bool?;
}

struct Container {
    c1: OptIntBool;
    c2: OptIntBool;
    c3: OptIntBool;
    c4: OptIntBool;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            c1: OptIntBool{ a:null, b:true },
            c2: OptIntBool{ a:1, b:null },
            c3: OptIntBool{ a:null, b:null },
            c4: OptIntBool{ a:5, b:false },
        };
    }
}