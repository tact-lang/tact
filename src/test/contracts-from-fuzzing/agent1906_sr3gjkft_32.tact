// contract with persistent state variable of an optional struct with optionals inside

struct Inner {
    str: String?;
    b: Bool?;
}

contract InInIn {
    val: Inner?;

    init() {
        self.val = null;
    }
}
