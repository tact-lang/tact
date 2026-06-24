struct Data { num: Int; txt: String?; }

contract GetterOpt {
    val: Data?;

    init() {
        self.val = null;
    }

    get fun data(): Data? {
        return self.val;
    }
}