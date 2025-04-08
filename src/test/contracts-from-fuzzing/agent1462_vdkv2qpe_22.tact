// optional struct containing a string and int
struct Data {
    s: String;
    i: Int;
}

contract OptStruct {
    d: Data?;

    init() {
        self.d = null;
    }
}