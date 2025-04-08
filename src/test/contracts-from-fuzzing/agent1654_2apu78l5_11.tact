struct OptBool {
    b: Bool?;
}

contract TestContract {
    data: OptBool;
    init() {
        self.data = OptBool{ b: null };
    }
}