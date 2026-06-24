struct OptInt {
    v: Int?;
}

struct OptNested {
    inner: OptInt?;
}

contract TestContract {
    data: OptNested;

    init() {
        self.data = OptNested{
            inner: OptInt{v:null},
        };
    }
}