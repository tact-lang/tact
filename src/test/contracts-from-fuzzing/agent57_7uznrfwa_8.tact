struct OptionalInside {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct Container {
    inner1: OptionalInside;
    inner2: OptionalInside;
}

contract OptionalContainer {
    content: Container;

    init() {
        self.content = Container{
            inner1: OptionalInside{f1:null,f2:null,f3:null},
            inner2: OptionalInside{f1:null,f2:null,f3:null}
        };
    }
}