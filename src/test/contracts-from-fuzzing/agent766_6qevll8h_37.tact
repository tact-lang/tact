// optional struct containing optionals
struct OptStruct {
    a: Int?;
    b: Bool?;
}

contract Test {
    val: OptStruct?;

    init() {
        self.val = OptStruct{ a:null, b:true };
    }
}