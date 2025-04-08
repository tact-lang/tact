struct OptStruct {
    s: SubStruct?;
}

struct SubStruct {
    x: Int;
    y: Bool;
}

contract OptTest {
    v: OptStruct;

    init() {
        self.v = OptStruct{
            s: null
        };
    }
}