struct OptionalInStruct {
    name: String;
    age: Int?;
}

contract OptionalStructComb {
    info: OptionalInStruct?;
    init() {
        self.info = null;
    }
}