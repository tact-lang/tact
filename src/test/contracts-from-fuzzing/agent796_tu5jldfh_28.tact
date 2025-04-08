// Optional string and nested wrapped in struct
struct Wrap {
    txt: String?;
}

contract TestContract {
    w: Wrap?;

    init() {
        self.w = null;
    }
}