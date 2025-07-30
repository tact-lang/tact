struct SubTail {
    code: Int as uint8;
    data: Slice as remaining;
}

struct Container {
    sub: SubTail? = null;
    label: String = "label";
}

contract FuzzCrazy {
    payload: Container? = null;

    init() {
        self.payload = Container{
            sub: SubTail{
                code: 128,
                data: emptyCell().asSlice()
            },
            label: "hi"
        };
    }
}