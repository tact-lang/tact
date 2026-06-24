struct OptionalStruct { a: Int?; b: Bool?; s: String? }

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: true,
            s: null
        };
    }
}