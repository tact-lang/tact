message Empty {}

message Wrapper {
    nested: Empty;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper { nested: Empty{} };
    }
}
