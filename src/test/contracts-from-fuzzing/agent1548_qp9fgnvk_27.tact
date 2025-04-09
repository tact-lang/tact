// optional bool in struct
struct OptBool {
    b: Bool?;
    x: Int;
}

contract Test {
    val: OptBool;

    init() {
        self.val = OptBool{ b:null, x:0 };
    }
}