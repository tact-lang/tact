struct Layer3 {
    text: String?;
    flag: Bool?;
}

struct Layer2 {
    data: Int?;
    next: Layer3?;
}

struct Layer1 {
    id: Int?;
    inner: Layer2?;
}

contract TestContract {
    complex: Layer1?;

    init() {
        self.complex = Layer1{
            id: null,
            inner: Layer2{
                data: 77,
                next: Layer3{
                    text: "hello",
                    flag: null
                }
            }
        };
    }
}