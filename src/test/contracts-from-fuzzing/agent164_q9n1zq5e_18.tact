struct Test {
    field: String?;
}

contract TestContract {
    data: Test = Test{};

    receive() {
        let _ = self.data.field;
    }
}