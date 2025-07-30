struct Left {
    v: Int;
}
struct Right {
    flag: Bool;
}

struct Wrapper {
    left: Left?;
    right: Right?;
    data: String?;
}

contract Test {
    val: Wrapper;
    init() {
        self.val = Wrapper{
            left: Left{v:1},
            right: null,
            data: "hi"
        };
    }
}