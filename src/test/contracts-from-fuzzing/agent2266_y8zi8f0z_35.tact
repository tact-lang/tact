struct Payload {
    info: String;
    note: String?;
}

struct Container {
    p1: Payload;
    p2: Payload?;
    p3: Payload;
}

contract Test {
    c: Container;

    init() {
        self.c = Container{
            p1: Payload{info:"a", note:null},
            p2: null,
            p3: Payload{info:"b", note:"n"},
        };
    }
}
