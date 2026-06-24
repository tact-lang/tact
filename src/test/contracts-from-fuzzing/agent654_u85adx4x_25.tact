// optional struct stored in contract
struct Info {
    x: Int;
    y: Bool;
}

contract TestContract {
    info: Info?;

    init() {
        self.info = null;
    }
}