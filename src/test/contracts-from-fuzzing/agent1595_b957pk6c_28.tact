// pattern: persistent contract field of a struct containing strings and optionals only
struct OStr {
    a: String?;
    b: String;
    c: String?;
}

contract TestContract {
    val: OStr;

    init() {
        self.val = OStr{a:null, b:"xx", c:"yy"};
    }
}