struct O1 {
    a: Int?;
}

struct O2 {
    nested: O1?;
}

struct O3 {
    nested: O2?;
}

contract DeepOptChain {
    val: O3;

    init() {
        self.val = O3{
            nested: null
        };
    }
}