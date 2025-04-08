struct Nest {
    data: Slice;
    flag: Int?;
}

struct Container {
    content: Nest;
}

contract Test22 {
    cont: Container;

    init() {
        self.cont = Container{
            content: Nest{
                data: emptyCell().asSlice(),
                flag: null,
            }
        };
    }

    receive() {}
}