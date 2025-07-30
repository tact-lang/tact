struct DeepNested {
    x: Int;
    y: Int?;
}

struct Wrapper {
    inner: DeepNested;
    flag: Bool;
}

contract TestContract {
    data: Wrapper;
    
    init() {
        self.data = Wrapper{
            inner: DeepNested{
                x: 1,
                y: null,
            },
            flag: true,
        };
    }
}