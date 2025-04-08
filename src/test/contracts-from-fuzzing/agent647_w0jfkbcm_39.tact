// optional String field in persistent contract state
contract TestContract {
    message: String?;

    init() {
        self.message = null;
    }
}