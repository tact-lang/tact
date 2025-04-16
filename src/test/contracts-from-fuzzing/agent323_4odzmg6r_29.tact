message(111) Empty {}

struct Wrapper {
    msg: Empty;
    code: Int;
}

contract Test {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            msg: Empty{},
            code: 777,
        };
    }
}