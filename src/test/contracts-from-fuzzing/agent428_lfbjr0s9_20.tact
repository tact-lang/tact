// contract with multiple nested structs, optional and non-optional
struct Info {
    name: String;
    amount: Int?;
}

struct Wrapper {
    info: Info;
    extra: String;
}

contract TestContract {
    w1: Wrapper;
    w2: Wrapper?;

    init() {
        self.w1 = Wrapper{ info: Info{ name:"Hi", amount:null }, extra:"E" };
        self.w2 = null;
    }
}