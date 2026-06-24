struct DeepStruct {
    nested: Int?;
}

struct Container {
    opt: DeepStruct?;
}

contract InitOptionals {
    box: Container;

    init() {
        self.box = Container{
            opt: null
        };
    }
}