// Deep nested structs with multiple optional branches
struct SubSub1 {
    x: Int?;
}

struct SubSub2 {
    y: String?;
}

struct Sub1 {
    s1: SubSub1?;
    s2: SubSub2?;
}

struct Sub2 {
    s1: SubSub1?;
    val: Bool?;
}

struct RootNode {
    left: Sub1?;
    right: Sub2?;
    flag: Bool;
}

contract TreeLike {
    root: RootNode;

    init() {
        self.root = RootNode{
            left: null,
            right: null,
            flag: false
        };
    }
}