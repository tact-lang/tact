message Empty {}

contract TestContract {
    data: Empty;

    init() {
        self.data = Empty{};
    }
}
