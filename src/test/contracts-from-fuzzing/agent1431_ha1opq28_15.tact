// Using default values for persistent struct fields
struct DefStruct {
    a: Int = 10;
    b: Bool = true;
    s: String = "hi";
}

contract TestContract {
    ds: DefStruct;

    init() {
        self.ds = DefStruct{};
    }
}