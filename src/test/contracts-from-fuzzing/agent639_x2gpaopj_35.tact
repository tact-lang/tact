struct NestedEmptyOptions {
    lvl1: Inner1?;
}

struct Inner1 {
    lvl2: Inner2?;
}

struct Inner2 {
    lvl3: Bool?;
}

contract NestedNulls {
    s: NestedEmptyOptions;
    init() {
        self.s = NestedEmptyOptions{
            lvl1:null
        };
    }
}