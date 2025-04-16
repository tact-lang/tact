// Optional wrapper over struct with optionals inside
struct OptStruct {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract OptionalWrapper {
    obj: OptStruct?;
    init() {
        self.obj = null;
    }
}