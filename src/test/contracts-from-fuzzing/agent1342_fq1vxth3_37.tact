// test default optional
struct Data {
    opt: String? = null;
}

contract DefaultOpt {
    d: Data;

    init() {
        self.d = Data{};
    }
}