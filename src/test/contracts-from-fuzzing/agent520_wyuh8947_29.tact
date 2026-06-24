// nested optional primitive fields with no explicit null
struct ChildOpt {
    id: Int?;
    flag: Bool?;
}

contract NestedOptionalNoExplicit {
    child: ChildOpt?;

    init() {
        self.child = null;
    }
}