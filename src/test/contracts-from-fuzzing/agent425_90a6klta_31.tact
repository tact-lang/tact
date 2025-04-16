// Duplicate optional nested in another optional
struct SubOpt {
    v: Int?;
}

struct MainOpt {
    sub: SubOpt?;
}

contract TestContract {
    data: MainOpt;

    init() {
        self.data = MainOpt{
            sub: null
        };
    }
}