// Persistent optional struct with some optional fields
struct OptStruct {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    optfield: OptStruct?;

    init() {
        self.optfield = OptStruct{
            a: 5,
            b: null
        };
    }
}