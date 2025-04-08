// Contract with struct containing String and String optional, nested default
struct SS {
    s: String;
    opt: String?;
}

contract TestContract {
    ss: SS;

    init() {
        self.ss = SS {
            s: "test",
            opt: null,
        };
    }
}