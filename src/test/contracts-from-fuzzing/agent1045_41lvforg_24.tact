// contract with nested complex optional structure with defaults

struct Inner {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

struct Container {
    a: Inner? = null;
    b: Inner? = null;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            a: Inner{x:null,y:true,z:null},
            b: null
        };
    }
}