struct Wrapper {
    num: Int = 5;
    optVal: Int?;
    flag: Bool = true;
}

contract TestContract {
    container: Wrapper?;

    init() {
        self.container = Wrapper {
            optVal: null
        };
    }
}