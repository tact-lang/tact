struct ArrLike {
    f0: Int;
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
}

struct Wrapper {
    inner: ArrLike;
}

contract TestContract {
    field: Wrapper;

    init() {
        self.field = Wrapper{inner: ArrLike{
            f0:0, f1:1, f2:2, f3:3, f4:4, f5:5, f6:6, f7:7
        }};
    }
}