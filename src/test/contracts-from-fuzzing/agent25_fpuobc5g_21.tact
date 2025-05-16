// combined contract fields and nested struct optionals
struct Deep {
    value: Int;
    flag: Bool?;
}
contract Test {
    first: Int;
    second: Bool;
    deep: Deep?;
    init() {
        self.first = 1;
        self.second = false;
        self.deep = Deep{ value:42, flag:null };
    }
}