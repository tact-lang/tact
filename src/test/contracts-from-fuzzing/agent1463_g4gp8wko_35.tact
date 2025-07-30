struct Rec {
    intVal: Int;
    strVal: String;
}

contract StructDefaultTest {
    r: Rec = Rec{intVal:42,strVal:"hello"};

    init() {
        self.r = Rec{intVal:1,strVal:"x"};
    }
}
