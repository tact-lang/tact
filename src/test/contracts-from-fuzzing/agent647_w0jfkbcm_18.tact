// A contract with persistent optional struct
struct Info {
    val: Int;
    txt: String;
}

contract OptStructContract {
    info: Info?;

    init() {
        self.info = null;
    }
}