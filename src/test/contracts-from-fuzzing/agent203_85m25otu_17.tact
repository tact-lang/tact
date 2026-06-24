struct X {
    flag: Bool;
    data: Data?;
}

struct Data {
    val: Int;
    message: String;
}

contract TestContract {
    storage: X;

    init() {
        self.storage = X{
            flag: false,
            data: null,
        };
    }
}