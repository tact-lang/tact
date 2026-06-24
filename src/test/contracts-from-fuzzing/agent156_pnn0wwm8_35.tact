struct Container {
    a: Int;
    b: Bool;
    c: String?;
}

contract NullInContainer {
    cont: Container;

    init() {
        self.cont = Container{
            a:1, b:true, c:null
        };
    }
}
