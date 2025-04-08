struct OptInt {
    val: Int?;
}

struct Wrapper {
    inside: OptInt;
}

contract TestContract {
    container: Wrapper;

    init() {
        self.container = Wrapper{
            inside: OptInt{ val: null }
        };
    }
}