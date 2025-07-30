struct SubInfo { note: String?; code: Int; }

contract NestedOptOpt {
    info: SubInfo?;
    init() {
        self.info = SubInfo{ note: null, code: 7 };
    }
}