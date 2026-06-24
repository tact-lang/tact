struct Inner {
    a: Int;
    b: Bool;
}

message ExampleMsg {
    field: Inner;
}

contract MessageField {
    f: ExampleMsg;

    init() {
        self.f = ExampleMsg{field: Inner{a:1,b:true}};
    }
}