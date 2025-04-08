// Test large nested optionals inside struct inside persistent field

struct OptStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    optField: OptStruct?;

    init() {
        self.optField = null;
    }

    receive() {
        let _ = self.optField;
    }
}