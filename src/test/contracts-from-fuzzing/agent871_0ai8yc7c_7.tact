struct Inner {
    flag: Bool = false;
    text: String = "";
}

struct Wrapper {
    intVal: Int = 7;
    nested: Inner;
}

contract DefaultTest {
    state: Wrapper = Wrapper{
        nested: Inner{}
    };

    init() {}
}