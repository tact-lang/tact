// optional struct wrapper containing optional fields, as contract storage
struct Hull {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract TestContract {
    hull: Hull?;

    init() {
        self.hull = null;
    }
}