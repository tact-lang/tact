struct DeepOpt { a: Int?; }
struct Wrapper { val: DeepOpt?; }

contract NestedOptStructs {
    storage: Wrapper;
    init() {
        self.storage = Wrapper{ val:null };
    }
}