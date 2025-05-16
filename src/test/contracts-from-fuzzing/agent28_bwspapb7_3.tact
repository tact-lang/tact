struct Opts { a: Int?; b: Bool?; c: String?; }

contract TestContract {
    optStruct: Opts;

    init() {
        self.optStruct = Opts{
            a: null,
            b: true,
            c: null
        };
    }
}