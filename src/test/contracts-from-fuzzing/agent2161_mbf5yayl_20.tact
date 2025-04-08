// test string optional nested in struct
struct Container {
    data: String?;
}

contract OptStringStorage {
    val: Container;

    init() {
        self.val = Container{ data: null };
    }
}