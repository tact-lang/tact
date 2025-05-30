struct Inner {
    x: Int;
    y: Bool;
}

struct Wrapper {
    z: Inner;
    flag: Bool;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            z: Inner{
                x: 123,
                y: true
            },
            flag: false
        };
    }
}